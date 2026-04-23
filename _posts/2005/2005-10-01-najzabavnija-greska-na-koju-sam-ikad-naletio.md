---
tags:  hrvatski
title: Najzabavnija greška na koju sam ikad naletio
---
![Mythos. Grčka žuja. Jedan od dokumenata u radnom mjestu Krigla (za potrebe testa kopiran u radno mjesto Željko).](/assets/2005/najzabavnija-greska-na-koju-sam-ikad-naletio/1620308090.jpg)

Za jednu našu web aplikaciju smo radili novu funkcionalnost.

Aplikacija služi za komunikaciju između korisnika.  
Podijeljena je na radna mjesta (e-Workspaces). Ona okupljaju korisnike sa nekim interesom (moje omiljeno radno mjesto je Krigla, tamo se sve vrti oko toga gdje je piva najveća, najhladnija i najjeftinija).  
Nakon registracije, korisnik traži članstvo u nekom radnom mjestu (ili više njih). Tamo komunicira s ostalim korisnicima.

Kako?

- sudjelovanjem u diskusijama - pije li se piva iz čaše (krigle?) ili boce
- dodavanjem dokumenata - slike podložaka, boca, limenki...
- dodavanjem najava - "tad i tad" besplatna piva "tamo i tamo"
- zadataka - ovaj vikend "taj i taj" kupuje pivu, a "taj i taj" se brine da bude hladna
- linkova - piva.org
- kontakata - adrese svih pivovara
- popunjavanjem kalendara događajima - dani "te i te" pive
- sastancima - godišnja skupština pivoljubaca
- ...

Sve funkcionalnosti aplikacije su dostupne samo registriranim korisnicima. Sad su poželili da su neke stvari dostupne i neregistriranim korisnicima. Nova funkcionalnost je nazvana public pages (interno sam si to preveo kao javne stranice).

Testirao sam u mom omiljenom pregledniku [Firefox-u](http://www.mozilla.org/products/firefox/) (FF).  
Napravio sam novo radno mjesto koje sam nazvao Željko, po jednom testeru.  
Napunio sam moje novo radno mjesto raznolikim sadržajima (jednu datoteku možete vidjeti na slici).  
Dopustio sam da sav sadržaj bude vidljiv i na javnim stranicama.  
Malo sam kliktao okolo po tim javnim stranicama, kad odjednom, otvori mi se stranica [Željka Joksimovića](http://www.zeljkojoksimovic.com/), srpskog pjevača.  
Možda je netko gledao Eurosong 2004, gdje je pjevao Lane Moje (ovaaaj... nisam to gledao, pročitao sam upravo na njegovim stranicama).

E, to me stvarno iznenadilo.  
Probao sam ponoviti grešku, i vrlo brzo uspio.  
Obrisao sam sve iz tog radnog mjesta, dodao nove stvari, obrisao cijelo radno mjesto, pa ga napravio iznova, i još puno toga. Nakon svake navedene akcije i malo kliktanja po javnim stranicama, opet sam uspio završiti kod imenjaka.

Pokušao sam ponoviti grešku i u [Internet Explorer-u](http://www.microsoft.com/windows/ie/default.mspx) (IE).  
Tamo sam naletio na sasvim drugu grešku.  
Pojavi mi se stranica sa porukom "The page cannot be displayed", a u adresnoj traci piše "http://željko/".

Opa!

Naime, javne stranice su imale grešku u navigaciji. Na nekom mjestu (ne sjećam se više kojem), umjesto da me usmjere na "http://{url\_aplikacije}/Public/{ime\_radnog\_mjesta}", poslalo me na "http://{ime\_radnog\_mjesta}", što je u ovom slučaju bilo "http://željko/".  
Naravno, taj url ne postoji i IE me je lijepo o tome obavijestio.

FF bi isto bio usmjeren na http://željko/, ali on kad ne bi našao taj url, napravio bi Google pretragu za "željko" i automatski (bez ikakvog pitanja) otvorio stranicu koja je prva na listi.

Sad znam tko je prvi na listi.
