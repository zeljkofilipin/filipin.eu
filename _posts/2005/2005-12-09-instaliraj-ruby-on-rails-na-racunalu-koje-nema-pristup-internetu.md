---
tags:  code hrvatski image ruby
title: Instaliraj Ruby on Rails na računalu koje nema pristup Internetu
---
![Đžogljavko pored pruge (engl. rail).](/assets/2005/instaliraj-ruby-on-rails-na-racunalu-koje-nema-pristup-internetu.jpg)

Pisao sam o tome kako napraviti [Ruby on Rails](http://www.rubyonrails.org/) web aplikaciju.

Želio sam prenijeti tu aplikaciju na drugo računalo (engl. computer). Postupak je iznimno jednostavan.

Na drugom računalu sam napravio korake 2-7 (od dva do sedam) iz spomenutog članka. Prenio sam mapu (engl. folder) u kojoj se nalazi moja aplikacija (`C:\rails\blog`) s mog računala na drugo računalo. Pokrenuo sam aplikaciju na drugom računalu. Sve radi.

Mapu možete prenijeti usb-om, spržiti (engl. burn) na cd, sažeti (engl. compress) pa postati e-poštom (engl. e-mail)...

Problem se pojavio kad sam htio pokrenuti Ruby on Rails aplikaciju na računalu koje nema pristup Internetu. Dugo sam se s tim mučio, i sad kad sam našao rješenje, što drugo nego ga objaviti. :)

## Na svom računalu

Napravi `C:\install` (možeš odabrati i manje štrebersko ime). Tu češ natrpati sve što ti treba:

1.  [ruby182-15.exe](http://rubyforge.org/frs/download.php/4174/ruby182-15.exe)
2.  [sqlite-3\_2\_7.zip](http://www.sqlite.org/sqlite-3_2_7.zip)
3.  [sqlitedll-3\_2\_7.zip](http://www.sqlite.org/sqlitedll-3_2_7.zip)
4.  [sqlite3-ruby-1.1.0-mswin32.gem](http://rubyforge.org/frs/download.php/3087/sqlite3-ruby-1.1.0-mswin32.gem)
5.  [rails-0.14.4.gem](http://rubyforge.org/frs/download.php/7589/rails-0.14.4.gem)
6.  [rake-0.6.2.gem](http://rubyforge.org/frs/download.php/6356/rake-0.6.2.gem)
7.  [activesupport-1.2.4.gem](http://rubyforge.org/frs/download.php/7575/activesupport-1.2.4.gem)
8.  [activerecord-1.13.1.gem](http://rubyforge.org/frs/download.php/7571/activerecord-1.13.1.gem)
9.  [actionpack-1.11.1.gem](http://rubyforge.org/frs/download.php/7580/actionpack-1.11.1.gem)
10. [actionmailer-1.1.4.gem](http://rubyforge.org/frs/download.php/7583/actionmailer-1.1.4.gem)
11. [actionwebservice-0.9.4.gem](http://rubyforge.org/frs/download.php/7586/actionwebservice-0.9.4.gem)
12. mapu u kojoj se nalazi tvoja aplikacija (`C:\rails\blog`)

## Prebacivanje

Prebaci `C:\install` sa svog računala u `C:\install` na željenom računalu koristeći svoj omiljeni način (usb, cd, e-pošta...).

## Na drugom računalu

1.  instaliraj ruby
    1.  dvaput klikni na `C:\install\ruby182-15.exe`
2.  instaliraj SQLite
    1.  prebaci `C:\install\sqlite-3_2_7.zip` i `C:\install\sqlitedll-3_2_7.zip` u `C:\ruby\bin`
    2.  raspakiraj obje zip datoteke (engl. file)
3.  otvori Command Prompt
    1.  start &gt; Run
    2.  utipkaj `cmd`
    3.  pritisni `enter`
4.  utipkaj u Command Prompt {% highlight shell %}
c:
cd \install
gem install sqlite3-ruby
gem install rails
gem install rake
gem install activesupport
gem install activerecord
gem install actionpack
gem install actionmailer
gem install actionwebservice
cd blog
ruby script\server
{% endhighlight %}

Ako ti nešto nije jasno, pročitaj prvo prethodni članak. :)
