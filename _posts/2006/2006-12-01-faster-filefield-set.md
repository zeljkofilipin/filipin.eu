---
tags:  code ruby
title: Faster FileField#set
---
This is slightly edited conversation [Is there a way to make file\_field.set faster?](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg05905.html) from wtr-general mailing list.

Me:

> Is there a way to make `file_field.set` faster?
>
> I have noticed that this is the slowest part of my tests. It takes about 10 seconds to set file field. I have read that it can not be set directly because that would be security issue, but I wonder what I could do to make it faster. I upload extremely small files (a few bytes), but I have to do it frequently, and every time it takes about 10 seconds just to set file field.

Mark Cain:

> This works for me and it is much faster because it uses the handle of the object.

{% highlight ruby %}
def startClicker(button, waitTime=5, user_input=nil)
  hwnd = @@ie.enabled_popup(waitTime)  # get a handle if one exists
  if (hwnd) # yes there is a popup
    w = WinClicker.new
    if (user_input)
      w.setTextValueForFileNameField(hwnd, "#{user_input}")
    end
    sleep 3 # I put this in to see the text being input it is not necessary to work
    w.clickWindowsButton_hwnd(hwnd, "#{button}")  # "OK" or whatever the name on the button is
    w = nil # this is just cleanup
  end
end
{% endhighlight %}

Me:

> `startClicker `works double faster than `file_field.set`.

Then I removed line with `sleep 3`.

Me:

> It is now even faster (for three seconds) after I removed line with `sleep 3` (when I noticed that comment says that it can be removed).
>
> `file_field.set` needed approximately 10.6 seconds to set file field, `startClicker `4.4, and when I removed `sleep 3,` it is down to 1.4. That saved me approximately 9 seconds for each file upload (and I do it a lot).

[Paul Rogers](http://www.paulrogers.ca/) also suggested [AutoIt](http://www.autoitscript.com/autoit3/), but this works fast enough, so I did not even try it.
