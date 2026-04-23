---
tags:  code ruby
title: How to Organize Watir Files
---
My Watir scripts became too big for one file, so I split them in several files. But then number of files became too big so I moved them to folders. Something like this

{% highlight plaintext %}
- conf (folder: yaml configuration files)
-- builder.yml
-- stager.yml
...
- file (folder: files for upload)
-- file.txt
-- attachment.txt
...
- lib (folder: files that contain my modules, classes, methods...)
-- File.rb
-- User.rb
...
- test (folder: files that contain tests)
-- all_tests.rb
-- core_tests.rb
-- file_tests.rb
-- user_tests.rb
...
{% endhighlight %}

And it works just fine. Just add this code at the top of files that need it (`all_tests.rb`, `core_tests.rb`...):

{% highlight ruby %}
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "file_name"
{% endhighlight %}
