# tykkays20-solmini-env

Minimalistinen Solitan infraan nivoutuva projekti-infra.

Toteutus yksinkertainen Shell-skripti, joka ajetaan RHEL7 koneessa ylläpito-
oikeuksin.

## Vaatimukset

RHEL7, internet, levytilaa, ylläpito-oikeudet, DNS cname *.tykkays20.solita.fi osoittamaan palvelimelle
tai clienteille hosts tiedosto

ssh-tunnus, jolla on wheel group kohdepalvelimella

````bash
[root@jallu3 ~]# useradd petrisi
[root@jallu3 ~]# passwd petrisi
Vaihdetaan käyttäjän petrisi salasana.
Uusi salasana:
Anna uudelleen uusi salasana:
passwd: kaikki todennuspoletit päivitetty.
[root@jallu3 ~]# usermod -aG wheel petrisi
````

## Ympäristön pystytys

Suorita skripti:

````bash
[petrisi@bonaqua ~]$ ansible-playbook -i dev-inventory --ask-become-pass tykkays20.yml
````

, joka asentaa:

 - Dockerin
 - nginx front reverse proxyn virtual host automaatilla
 - (dev|test|qa|prod).solmini.tykkays20.solita.fi demo palvelut (nginx), ja laittaa sinne tarjolle Hello, world! sivun.
 - Jenkins CI palvelimen (jenkins.solmini.tykkays20.solita.fi)

Käy selaimella osotteessa:

`dev.solmini.tykkays20.solita.fi` tai `jenkins.solmini.tykkays20.solita.fi`
