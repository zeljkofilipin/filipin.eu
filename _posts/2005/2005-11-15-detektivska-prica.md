---
tags:  hrvatski image
title: Detektivska priča
---
![Veliki detektiv Đžogljavko sa svojim opasnim pištoljem, vjetrom u kosi i mrkim pogledom.](/assets/2005/detektivska-prica.jpg)

Jučer smo Đžogljavko i ja riješili težak slučaj. Bilo je tu puno akcije, intrige, alibija, motiva, nacrtanih pištolja, vjetra u kosi i mrkih pogleda (na slici).

Testiram jednu lijepu aplikaciju. Svakim danom je sve ljepša. Dodaju se nove funkcionalnosti, poboljšavaju stare, čisti se kod, testira se sve u šesnaest... Dodao sam nekoliko novih testova za dokumente. Isprobao svakog od njih pojedinačno. Sve lijepo radi. Pustio ih sve skupa. Javi mi grešku "nešto se sprčkalo u bazi". Lijepo. Znači svaki test prolazi pojedinačno, ali neka kombinacija uzrokuje grešku. Bacim oko na testove.

<!-- markdownlint-disable-next-line MD036 -->
*(Neću objašnjavati u detalje testova. Bitno je to da se stvari odvijaju u nečemu zvanom zajednica, koja je moderirana. Moderirana znači da većinu stvari koje član napravi mora odobriti moderator. Moderator mi je ružna riječ pa ću ga zvati gazda.)*

**član**: dodaj dokument

**gazda**: odobri dokument, pa ga kopiraj u drugu zajednicu

**član**: sazovi sastanak u vezi tog dokumenta, pa komentiraj dokument, pa ga snimi na svoje računalo, pa ga preporuči drugom korisniku, pa ga odjavi, pa ga prijavi

**gazda**: odobri prijavu, napravi prethodnu verziju trenutnom verzijom, premjesti u drugu mapu, odobri sastanak sazvan oko dokumenta

**član**: snimi na računalo prethodnu verziju dokumenta, odjavi pa prijavi dokument

**gazda**: odbij prijavu

**član**: promijeni opis dokumenta

**gazda**: odbij promjenu

**član**: promijeni opis dokumenta

**gazda**: prihvati promjenu

**član**: referenciraj dokument, pa ukloni referencu

**gazda**: obriši komentar, obriši prethodnu verziju, obriši dokument

Tu pukne. Na "obriši dokument". Na zadnjem testu u vezi dokumenata. Baš lijepo. Nije moglo pući negdje na početku. Ili barem na pola. Nego baš na kraju. Lijepo. Baš lijepo. Pukne. S cijelom stranicom izvješća o grešci. Koja meni ništa ne znači. Prijavio sam grešku (i priložio onu cijelu stranicu izvješća o grešci, neka se nađe) i kao svaki dobar tester, išao je ponoviti ručno.

Napravio dokument, odobrio ga, pa obrisao. Radi. Hm. Napravio dokument, odobrio ga, kopirao u drugu zajednicu, pa ga obrisao. Radi. Hmm. Neće ovo biti tako jednostavno. Odustajem od ručnog testiranja (za sad).

Da si smanjim komplikacije s ovim silnim odobravanjem, neka testove radi gazda. Kad on sam nešto napravi, to se ne mora odobriti. Nakon svih testova, pukne na brisanju. Barem mogu izbaciti odobravanja. Pa sam izbacio sve u vezi sastanka sazvanog oko dokumenta. Pustio testove. Opet pukne na brisanju. Znači nije u vezi sastanka.

Da ne pišem cijeli detektivski roman, otkrio sam (nakon dosta testiranja, ručnog i ne ručnog (nožnog)) da se problem pojavljuje kad kopiram dokument u drugu zajednicu i onda mu promijenim naslov.

Svijet je sad ljepše mjesto. Djeca se mogu sigurnije igrati na ulici znajući da je još jedna greška privedena pred lice pravde.
