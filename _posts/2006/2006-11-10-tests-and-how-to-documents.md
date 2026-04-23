---
tags:  code ruby
title: Tests and How-To Documents
---
You have a bunch of tests, right? With every build of your application under test, you run them all. If a test fails, application should be fixed, or you test should be fixed. Wouldn't it be nice to make how-to documents from that tests?

Time for an example (Ruby, Watir):

{% highlight ruby %}
def login_as(username, password)
  ie.goto("my.app/login")
  ie.should_contain("please login")

  ie.text_field(:id, "username").set(username)
  ie.text_field(:id, "password").set(password)
  ie.button(:value, "login").click
  ie.should_contain("logged in as #{username}")
end
{% endhighlight %}

You run that test, and you get output like this (this is real output from my test):

{% highlight shell %}
log in
- go to '[application url]/login.aspx'
- (url should be '[application url]/login.aspx')
- (there should be text 'Please Login')
- at text field 'userName' enter '[userName]'
- at text field 'password' enter '[password]'
- click button 'Login'
- (url should be '[application url]/default.aspx')
- (there should be text 'Recent Contributions')
- (there should be text 'logged in as [first name] [last name]')
{% endhighlight %}

I [posted](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg05762.html) this at wtr-general list and people recommended to take a look at rSpec and Systir.
