---
tags:  code ruby video youtube
title: Automating Google Hurdles
---
[<img src="/assets/2012/automating-google-hurdles/hurdles1.png" title="Google Hurdles" class="size-full wp-image-411" width="551" height="234" alt="Google Hurdles" />](http://www.google.com/doodles/hurdles-2012) Google Hurdles

Thanks to [Felipe Knorr Kuhn](http://knorrium.info/2012/08/07/automating-the-hurdles-google-doodle/) I have spent some time today automating [Google Hurdles](http://www.google.com/doodles/hurdles-2012).

The code is at [github.com/zeljkofilipin/olympics](https://github.com/zeljkofilipin/olympics) and it is pretty trivial. Felipe used [Sikuli](http://sikuli.org/) to automate the game and I used [Watir](http://watir.com/). Since the game is inside `canvas` element I could not do anything but send keys blindly (left and right for running, space for jump).

[<img src="/assets/2012/automating-google-hurdles/hurdles.png" title="Google Hurdles Score" class="size-full wp-image-400" width="559" height="237" alt="Google Hurdles Score" />](http://www.google.com/doodles/hurdles-2012) Google Hurdles Score

<iframe width="420" height="315" src="http://www.youtube.com/embed/o0ziwUfoExA?rel=0" frameborder="0" allowfullscreen></iframe>
