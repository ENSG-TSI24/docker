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



CE que j'ai fait :

docker stack deploy -c docker-compose.yaml galera
docker service ls
Une fois que la seed est à 1
docker service scale galera_seed=0
docker service scale galera_node=1
docker service scale galera_node=2
docker service scale galera_node=3


changer le mot de passe :

docker exec -it -u www-data galera_nextcloud.1.y3797iqlet4bqjan12kf3dnyz bash
~/html$ ./occ user:resetpassword admin

Ensuite il faut aller sur apps et etre sur que OnlyOffice soit able

Vérifier les trusted_domains dans:
docker exec -it -u www-data galera_nextcloud.1.y3797iqlet4bqjan12kf3dnyz bash
cd config
cat config.php
retourner dans la racine:
cd ..
puis avec les bon paramètres
./occ config:system:set trusted_domains 2 --value=localhost:8082





