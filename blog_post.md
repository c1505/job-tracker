Moving a previous sinatra application to rails in order to expand features.

You can view the previous application here.

## Why Move?

## Integration with Indeed API
I made a small project to work with the indeed API here: INSERT LINK and now I want
to integrate it into this application.  

I have an idea of how I want to use it to add job posting information to the application database for further review.  Start simpler though.  

No persistance needed at the beginning and maybe not at all.  

Start by simply copying over files

### Issues
Guard broke.  not sure why

It seems that I can't run specific RSPEC tests with how it is setup.  If I run just the model test, it RPSEC isn't seeing my model that isn't inheriting from activerecord base.  Shame since running the feature tests takes longer.  I'll probably want to fix that when moving on to testing more things in the models

#### Issue 2
My tests did not see my secret key... well that is because I only added it to

``` ruby
development:
  secret_key_base: key
  indeed_key: key
test:
  secret_key_base: key
  indeed_key: key

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  indeed_key: key
```  
