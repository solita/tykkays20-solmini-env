# tykkays20-solmini-env

Minimalistinen Solitan infraan nivoutuva projekti-infra.

Toteutus yksinkertainen Shell-skripti, joka ajetaan RHEL7 koneessa ylläpito-
oikeuksin.

## Vaatimukset

RHEL7, internet, levytilaa, ylläpito-oikeudet

## Ympäristön pystytys

Suorita skripti:

````bash
build-env.sh
````

, joka asentaa:

 - Dockerin
 - nginx reverse proxyn
 - nginx palvelun, ja laittaa sinne tarjolle

Käy selaimella osotteessa:

`solmini.tykkays20.solita.fi`

Jos nimipalvelu ei toimi, lisää kyseinen osoite ensin käsin koneesi nimipalveluun.

Esimerkiksi:

`sudo echo "80.69.173.135 solmini.tykkays20.solita.fi" >> /etc/hosts`