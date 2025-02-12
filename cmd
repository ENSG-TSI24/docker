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
docker services ls
docker service rm yi58xa0fnznw yxr7c92zye43 cytfiedt5igo



CE que j'ai fait :

docker stack deploy -c docker-compose.yaml galera
docker service ls
docker service scale galera_seed=0
docker service scale galera_node=1
docker service scale galera_node=2
docker service scale galera_node=3


changer le mot de passe :

docker exec -it -u www-data galera_nextcloud.1.y3797iqlet4bqjan12kf3dnyz bash
~/html$ ./occ user:resetpassword admin


sudo nano /var/www/html/nextcloud/config/config.php

'trusted_domains' => 
  array (
    0 => '192.168.0.29',
  ),

ajouter le domaine,

'trusted_domains' => 
  array (
    0 => '192.168.0.29',
    1 => 'cloud.example.com',
  ),






