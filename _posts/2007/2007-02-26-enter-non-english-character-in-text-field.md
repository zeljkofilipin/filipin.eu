---
tags:  code ruby
title: Enter Non-English Character in Text Field
---
![google\_zeljko.PNG](/assets/2007/enter-non-english-character-in-text-field.PNG)

I use [Watir](http://watir.com) a lot. I wanted to set a text field to `željko`. I did not know it would hard. I tried this code.

{% highlight ruby %}
browser.text_field(:index, 1).set("željko")
{% endhighlight %}

But, text field was set to `§eljko`, `Ĺľeljko`, just `eljko` or some other string (depending if I try from irb, or from file that is saved in some encoding).

I searched wtr-general and found different solutions.

I added

{% highlight ruby %}
require "win32ole"
WIN32OLE.codepage = WIN32OLE::CP_UTF8
{% endhighlight %}

and

{% highlight ruby %}
$KCODE = 'utf8'
require 'jcode'
{% endhighlight %}

to the top of the file.

I tried `TextField#value=` instead of `TextField#set`.

{% highlight ruby %}
browser.text_field(:index, 1).value=("željko")
{% endhighlight %}

I saved file as UTF-8.

Nothing worked. I sent [my question](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg07315.html) to wtr-general and [Paul Carvalho](http://www.staqs.com/) answered.

> \[...\] I have a Watir script \[...\] It reads the inputs from an Excel file into an Array and then I use the array data to populate the text fields. \[...\] I didn't use any special 'require' lines or KCodes. I just let Excel worry about holding the data \[...\]

I tried it, and it worked! It was simple, too. Just a few lines of code.

{% highlight ruby %}
require 'watir'
excel = WIN32OLE::new('excel.Application')
workbook = excel.Workbooks.Open('C:\data.xls') # open file
worksheet = workbook.Worksheets(1) # the first worksheet
cell = worksheet.Range('a1')['Value'] # value of single cell
browser = Watir::IE.start('http://www.google.com/') # start IE
browser.text_field(:index, 1).set(cell) # set text field to value from cell
{% endhighlight %}
