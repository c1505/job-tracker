## Do
-add notes field
-turn interview date into just a text field with placeholder or a different selector
-refactor indeed.rb
-user authoriztion
-export to excel and/or csv
-try fakeweb gem for testing


## Maybe

-retrieve only posts from the last 21 days
-create a job from posting without additional request to indeed
-save a job from posting via javascript instead to avoid page refresh
-dream jobs
-Companies
-contacts index
-demo account that resets
-add in tracking from indeed
--need to first properly identify user
-login with another service

## Done
-ability to see more than the last 25 posts.

-only show unsaved jobs in job posting view
-only show unviewed jobs in job posting view
- go to job edit page after clicking save to enter in more information
-add more information upon creating a job posting

# Dream jobs
Could also keep track of things that just look cool to view the requirments maybe as something to move towards in the future.  

# Companies
I also want to keep track of companies I am interested in even if they don't have an opening at the moment.  I could have that seperate or keep it in jobs.  For now I will track it in jobs and see how that works.

# How many posts to display
I don't think i care to see postings greater than 30 days for sure.  Probably not more than 2 weeks so I think 3 weeks is a good cutoff.
# Recruiting contacts

# Heroku
Had a lot of trouble trying to deploy to heroku.  I didn't have my secrets.yml tracked in git, but i needed to according to heroku.  Devise needs a secret key.  

For some reason even after including my secrets.yml in git, it was still failing.  After some debugging, I figured out that it wasn't seeing the publisher_key.  Also that I should log better and fail at the beginning of methods.  I don't really know how to do a good job debugging in production.  There is probably a heroku console.  Yup!  Well google searching really failed me there.  Debug heroku basically got me nothing.  I could have figured this out really quickly with the console.  Oh well.

http://tammersaleh.com/posts/managing-heroku-environment-variables-for-local-development/ Helped me figure out how to actually put environment variables into heroku.  I was confused at first because when I wrote ``` Heroku Config ``` I expected to see my variable name because it was in the yaml file.  It wasn't there.  I could still add it fairly easily though once I knew how.  Just didn't think it would work.  Felt good when it finally did :) .

# Squashing Commits
So I commited my secrets.yml and had many commits after.  Did not push to github, but after all of that I didn't wants secrets.yml to be commited anymore.  It isn't as simple as adding it to the gitignore and removing it becuase it still is in your git history.  

Not if you squash the commits from before you added secrets.yml and after.  Squashing commits will come into play later, but I haven't used it yet.  Often when you submit a pull request, it is easier to for a reviewer to make sense of it when it is squashed into one commit.  If you change a file and then change it again in a slightly different way, what really matters is that final difference from the master branch you are submitting your pull request to.  Luckily there is an easy way to squash commits.  This was the simpliest I found:

```
git reset --soft HEAD~3 &&
git commit
```
Credit to this stackoverlfow post.  http://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git
# Status
It seems useful in the current state.  I should probably start dogfooding it.  Authorization not setup yet though.  

Having a lot of issues trying to deploy on heroku.  
Currently the call to the api that is working locally doesn't seem to be working in heroku.  
# Intro



Moving a previous sinatra application to rails in order to expand features.

You can view the previous application here.

## Why Move?

## Integration with Indeed API
I made a small project to work with the indeed API here: INSERT LINK and now I want
to integrate it into this application.  

I have an idea of how I want to use it to add job posting information to the application database for further review.  Start simpler though.  

No persistance needed at the beginning and maybe not at all.  

Start by simply copying over files

I had to move my secrets to secrets.yml and modify a test file, but it was pretty painless overall.  Back to green.  What next?

Ultimately, I want to show results on a page and save the ones that I want to apply to and/or further evaluate.

## Saving a posting to the application
Looks like I will have to scrape to get some of the information I want.  I want to save the complete posting body.  

I guess I could start with the intermediate information and just create from the information I have access to through the api.  Still includes alot of the relevant information I need.  Then prompt the user to click the link for the full description.  

This way I can still accomplish the goal of knowing where the job lies on my processing.  Viewed, Applied, ect...





### Issues
Guard broke.  not sure why

It seems that I can't run specific RSPEC tests with how it is setup.  If I run just the model test, it RPSEC isn't seeing my model that isn't inheriting from activerecord base.  Shame since running the feature tests takes longer.  I'll probably want to fix that when moving on to testing more things in the models

Well that was less of a problem than I thought.  I am used to rails just having everything available and didn't care to look that inside the spec file I hadn't included and needed to:
```ruby
require "rails_helper"
```

#### Issue 2
My tests did not see my secret key... well that is because I only added it to

## Random
Learned that I can't visit a page and have a second expect withing one Rspec block

### How to process incoming postings to remove the ones that I don't want to display?
I think I need to delete what is in the json if it matches anything that is stored.  

### Faking hitting an api in tests
You want to test that you are hitting an api when if you do, but the tests that aren't related explicitly to that, probably should fake it.  

What to do when you don't know what api data you will get... it will change  

## Resources
### Inspiration
http://www.forbes.com/sites/nextavenue/2015/05/04/job-search-3-online-tools-to-stay-on-track/#51437e0532bc


``` ruby
development:
  secret_key_base: key
  indeed_key: key
test:
  secret_key_base: key
  indeed_key: key

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  indeed_key: key
```



##
