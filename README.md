# Gestiune Depozite ; Proiect-BD

Baza de date pe care am creeat-o este folositoare pentru gestionarea operațiunilor logistice în mai multe depozite. Cu ajutorul acestei baze de date putem verifica informații despre produsele aflate în fiecare depozit, care este furnizorul principal de bunuri al depozitului precum si cine este responsabilul depozitului. Modelul permite gestionarea stocurilor din fiecare depozit, depozitele și locațiile în care se află fiecare, gestionarea preturilor și cantităților din fiecare produs etc. , toate acestea pentru a facilita analiza și administrarea eficientă a unei afaceri.
    Tabela Furnizori stochează detalii despre entitățile care furnizează bunuri către afacere, precum numele furnizorului și adresa de e-mail. Acest tabel facilitează gestionarea și comunicarea cu furnizorii. Fiecare depozit are un furnizor.
    Locatii_pr conține informații referitoare la locații și adrese asociate depozitelor. Aceasta tabelă permite identificarea precisa a fiecarui depozit astfel putem afla locatia fiecarui produs aflat intr-unul dintre stocuri.
   &emsp; Tabelul Depozite stochează date despre depozitele folosite pentru stocarea produselor furnizate. Fiecare depozit este asociat cu un furnizor și o locație specifică.
    În Produse_pr sunt înregistrate detalii despre produsele disponibile, inclusiv denumirea, categoria și data de fabricare a fiecărui produs.
    Stocuri este tabela responsabilă pentru monitorizarea cantităților disponibile și a prețurilor produselor în fiecare depozit. Fiecare depozit poate avea mai multe stocuri iar un produs se poate afla în mai multe stocuri.


Alte detalii, schema conceptuala a bazei de date, interogari se afla în documentul " Gestiune Depozite - Proiect Baze de date.docx ".
