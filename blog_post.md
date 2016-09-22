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



### Issues
Guard broke.  not sure why

It seems that I can't run specific RSPEC tests with how it is setup.  If I run just the model test, it RPSEC isn't seeing my model that isn't inheriting from activerecord base.  Shame since running the feature tests takes longer.  I'll probably want to fix that when moving on to testing more things in the models

Well that was less of a problem than I thought.  I am used to rails just having everything available and didn't care to look that inside the spec file I hadn't included and needed to:
```ruby
require "rails_helper"
```

#### Issue 2
My tests did not see my secret key... well that is because I only added it to

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
