---
tags:  hrvatski image
title: Jednostavnost
---
![1615160739.jpg](/assets/2005/jednostavnost.jpg)

Od kad radim testiram, prošao sam nekoliko aplikacija, počeo programirati u [Ruby](http://www.ruby-lang.org/)-ju, testirati web aplikacije pomoću [Watir](http://watir.com/)-a, pročitao nekoliko knjiga o testiranju i hrpu blogova koje pišu testeri...

Dok nisam znao napraviti program koji će to testirati za mene, morao sam to raditi ručno. Otvoriti preglednik (browser), otići na adresu aplikacije, prijaviti se, kliktati okolo, upisivati ponešto, paziti što se događa.

Danas imam programe koji mi pomažu u tome.

Od kad pišem te programe, već nekoliko puta sam **sav** kod bacao u smeće i kretao iz početka. To sam opet napravio prije nekoliko dana.

A priča ide ovako...  
U početku, napravio sam tonu običnog, proceduralnog koda.  
Zatim sam se počeo igrati sa objektno orijentiranim pristupom, bacio sav svoj stari kod, prebacio sve u objekte i napravio grešku u koracima. Sve sam zakomplicirao.  
Svaku web stranicu koji bi moj program otvarao, provjeravao sam na sve i svašta.

Ima li stranica očekivanu:

- dugmad,
- potvrdne kućice (check boxes),
- polja za datoteke (file fields),
- slike,
- linkove,
- radio dugmad (radio buttons),
- polja za odabir (select fields),
- polja za tekst (text fields),
- tekst,
- naslov,
- url.

Na kraju, radio sam malo testova koji su provjeravali sve živo.

Upravo radimo nadogradnju jedne naše aplikacije. Odlučio sam skriptirati sve testove koje postoje za tu aplikaciju i napraviti nove testove, čak i prije nego nove funkcionalnosti budu gotove.  
Ali to nisam mogao napraviti brzo s mojim kompliciranim kodom. Odlučio sam sve baciti i početi, još jednom, iz početka.  
Raditi puno testova sa samo najnužnijim provjerama.  
Ustrajati u jednostavnosti koda.  
Za sad mi dobro ide.
