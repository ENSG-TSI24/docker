lancer onlyOffice-nextCloud:
git clone https://github.com/ONLYOFFICE/docker-onlyoffice-nextcloud
cd docker-onlyoffice-nextcloud
sudo docker-compose up -d
sudo bash set_configuration.sh // sert a configurer normalement a faire après avoir été sur localhost




lancer galera:(aller dans galera)
 
docker swarm init
docker stack deploy -c docker-compose.yaml galera
docker service ls

docker service scale galera_node=2

pour tuer :
docker service ls
docker service rm yi58xa0fnznw yxr7c92zye43 cytfiedt5igo

docker service scale galera_node=1
docker service scale galera_node=2
docker service scale galera_node=3


changer le mot de passe :

docker exec -it -u www-data galera_nextcloud.1.y3797iqlet4bqjan12kf3dnyz bash
~/html$ ./occ user:resetpassword admin

A faire  :
cd dans Galera
docker stack deploy -c docker-compose.yaml galera

docker service ls
Une fois que la seed est à 1
docker service scale galera_seed=0

cd myOnlyOffice 
docker stack deploy -c docker-compose.yaml onlyoffice
docker service ls 
Une fois que le service est à 1

cd NextCloud
docker stack deploy -c docker-compose.yaml NextCloud

docker service ls 
Une fois que tout les service sont à 1


Ensuite il faut aller sur apps et etre sur que OnlyOffice soit able
Aplications ->Bureautique et Texte -> OnlyOffice install et Able
Ensuite Dans  Paramètres D'admistrastion ->Only Office 
!Afficher les parametres suplémentaires

Vérifier les trusted_domains dans:
docker exec -it -u www-data galera_nextcloud.1.y3797iqlet4bqjan12kf3dnyz bash
cd config
cat config.php
retourner dans la racine:
cd ..
puis avec les bon paramètres
./occ config:system:set trusted_domains 2 --value=localhost
./occ config:system:set trusted_domains 1 --value=NextCloud_nextcloud 

paramètre de onlyoffice server : 
- docker exec -it -u www-data galera_nextcloud.1.y3797iqlet4bqjan12kf3dnyz bash
- ./occ config:system:set trusted_domains 1 --value=NextCloud_nextcloud 
- secret
Adresse du ONLYOFFICE Docs: 
- http://onlyoffice_onlyoffice-document-server/
Clé secrète:
- secret
Adresse du ONLYOFFICE Docs pour les demandes internes du serveur:
http://onlyoffice_onlyoffice-document-server/
Adresse du serveur pour les demandes internes du ONLYOFFICE Docs : 
- http://NextCloud_nextcloud/



