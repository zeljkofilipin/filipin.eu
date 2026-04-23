---
tags:  hrvatski
title: Testiranje. Kako početi?
---
![Moj kućni ljubimac Čarapko njuška po aplikaciji. Hranim ga samo testiranjem.](/assets/2005/testiranje-kako-poceti.jpg)

Sjećam se svojih prvih dana na ovom poslu. Testirao sam istu aplikaciju koju i sad testiram. Srećom, naslijedio sam popriličnu količinu testova (ali na žalost samo za tu aplikaciju).

Posjeli su me za računalo, dali mi stotinjak testova napisanih u Wordu, url aplikacije (na stroju za testiranje, ne url gdje je sve "za pravo"), korisničko ime i lozinku administratora i rekli: "Testiraj".

Nakon nekoliko minuta osjećao sam se kao riba u vodi.

Testove sam poslije prebacio iz Worda u Excel (jako volim Excel), dodao koju kolonu, izbacio pokoju, popravio neke greščice koje sam našao (o da, i testeri rade greške)...

Ovo je jedan od tih testova. Ime mu je Napravi-Korisnika, a prezime Test-Funkcionalnosti. O klanovima testova (prepoznaju se po prezimenu) će biti riječi ovih dana. Test-Funkcionalnosti, naravno, provjerava da li neka funkcionalnost aplikacije radi ono što bi trebala. Svako drugo testiranje odbija, pozivajući se na kolektivni ugovor koji je njegov klan potpisao.

Svi testovi pretpostavljaju da je korisnik prijavljen u aplikaciju i da se nalazi na početnoj stranici (osim naravno testova za prijavu i odjavu).

- broj testa: 1
- korisnik: administrator
- naslov: napravi korisnika
- koraci:

1.  klikni link "napravi korisnika"
2.  popuni podatke, samo obavezna polja, označena \* (zvjezdicom)
3.  klikni dugme "nastavi"
4.  postavi ovlasti pristupa za pojedine zajednice
5.  klikni dugme "spremi"

- ulazni podaci:

1.  titula
2.  ime
3.  prezime
4.  država
5.  e-pošta
6.  korisničko ime
7.  lozinka
8.  ponovi lozinku
9.  ovlasti pristupa za pojedine zajednice

- očekivani rezultati

1.  povratna informacija da je korisnik napravljen
2.  korisnik je napravljen
