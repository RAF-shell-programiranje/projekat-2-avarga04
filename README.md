# Automatizovani deployment aplikacije i monitoring sistema

## Opis rešenja i arhitekture

Projekat predstavlja automatizovano rešenje za kreiranje infrastrukture i deploy
aplikacije korišćenjem alata **Terraform**, **Ansible** i **Bash skripte**.

Terraform se koristi za kreiranje cloud infrastrukture (virtuelna mašina,
mrežni resursi i javna IP adresa), dok se Ansible koristi za konfiguraciju
virtuelne mašine i deploy Java aplikacije kao sistemskog servisa.

Bash skripta `automatic_deploy.sh` predstavlja glavnu ulaznu tačku projekta i
automatizuje ceo proces – od kreiranja infrastrukture do deploy-a aplikacije.
Na ovaj način obezbeđen je brz, ponovljiv i automatizovan deployment bez ručne
konfiguracije.

## Uputstvo za pokretanje glavne skripte

Skripta se pokreće iz root direktorijuma projekta:

```bash
./automatic_deploy.sh <mod>


Ako se skripta pokrene bez parametara, ispisuje se poruka sa dostupnim režimima rada:

Usage: ./automatic_deploy.sh {provision|deploy|check-status|monitor|teardown}

Režimi rada

provision
Kreira infrastrukturu korišćenjem Terraform-a
Preuzima IP adresu virtuelne mašine
Automatski ažurira Ansible inventory.ini fajl

deploy
Pokreće Ansible playbook
Instalira potrebne pakete i deploy-uje aplikaciju na VM

check-status
Predviđen za proveru statusa sistema (trenutno placeholder)

monitor
Predviđen za monitoring aplikacije (trenutno placeholder)

teardown
Briše kompletnu infrastrukturu korišćenjem Terraform-a

Dodatne informacije

IP adresa virtuelne mašine se automatski ažurira u Ansible inventory fajlu
nakon provisioninga.

Za povezivanje na VM koristi se SSH autentifikacija pomoću privatnog ključa.

Skriptu je potrebno pokretati iz root direktorijuma projekta.