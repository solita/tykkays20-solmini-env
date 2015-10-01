# tykkays20-solmini-env

Minimalistinen Solitan infraan nivoutuva projekti-infra.

Toteutus yksinkertainen Shell-skripti, joka ajetaan RHEL7 koneessa ylläpito-
oikeuksin.

## Vaatimukset

RHEL7, internet, levytilaa, ylläpito-oikeudet, DNS cname *.tykkays20.solita.fi osoittamaan palvelimelle
tai clienteille hosts tiedosto

## Ympäristön pystytys

Suorita skripti:

````bash
build-env.sh
````

, joka asentaa:

 - Dockerin
 - nginx front reverse proxyn virtual host automaatilla
 - solmini demo palvelun (nginx), ja laittaa sinne tarjolle Hello, world! sivun.
 - Jenkins CI palvelimen

Käy selaimella osotteessa:

`solmini.tykkays20.solita.fi` tai `jenkins.tykkays20.solita.fi`
