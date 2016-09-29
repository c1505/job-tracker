## Do
- go to job edit page after clicking save to enter in more information
-turn interview date into just a text field with placeholder or a different selector
-add more information upon creating a job posting
-refactor indeed.rb

## Maybe
-create a job from posting without additional request to indeed
-save a job from posting via javascript instead to avoid page refresh

# Done
-only show unsaved jobs in job posting view
-only show unviewed jobs in job posting view





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
