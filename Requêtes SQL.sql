-- liste de tous les numéros d’avions
SELECT av_id from Avion;
-- Liste des noms des pilotes
SELECT pi_nom FROM pilote;
-- Liste des marques d’avions (sans doublon)
SELECT distinct av_const from avion;
-- Liste des vols pour Nice
SELECT Vo_id FROM vol where vo_site_arrivee='NICE';
-- Liste des avions qui ont plus de 200 places
SELECT av_id, av_capacite from Avion where av_capacite > 200;
-- Liste des avions AIRBUS localisés à Toulouse
SELECT av_id,av_const,av_site from Avion where av_const='AIRBUS' AND av_site='Toulouse';
-- Liste des avions AIRBUS allant à Paris
SELECT av_id, av_const, VO_SITE_ARRIVEE FROM vol, avion where avion.av_id=vol.VO_AVION and VO_SITE_ARRIVEE='Paris' and AV_CONST='AIRBUS';
-- Liste des vols Paris-Nice et Toulouse-Paris
SELECT vo_id,VO_SITE_DEPART,VO_SITE_ARRIVEE from vol where (VO_SITE_DEPART='Paris' and VO_SITE_ARRIVEE='Nice') or (VO_SITE_DEPART='Toulouse' and VO_SITE_ARRIVEE='Paris');
-- Liste des avions Airbus et Boeing
SELECT av_id,av_const from Avion where av_const='Airbus' or  av_const='Boeing';
-- Liste des Airbus ou des avions de plus de 200 places
select av_id, av_const, av_capacite from avion where av_const='AIRBUS' or av_capacite > 200;
-- Liste des avions AIRBUS qui ne sont pas localisés à Toulouse
select av_id, av_const, av_site from avion where av_const='AIRBUS' and not av_site ='Toulouse';
-- Liste des Airbus qui ne vont pas à Paris
select av_id, av_const, vo_site_arrivee from avion 
inner join vol
on avion.av_id=vol.VO_AVION
where av_const='Airbus'
and not VO_SITE_ARRIVEE='Paris';
-- Liste des avions pour Paris qui ne sont pas des Airbus
select av_id,av_const from avion where not (av_const='Airbus')
 and av_id 
 in (select vo_avion from vol where VO_SITE_ARRIVEE='Paris');
 -- Liste de tous les vols avec le nom des avions
 select vo_id, av_const from avion, vol where  avion.av_id=vol.VO_AVION ;
 -- Type et capacité des avions en service (donc des avions qui volent !)
 select av_modele, av_capacite from avion;
 -- Liste des avions AIRBUS allant à Paris
 select av_id,av_const,vo_site_arrivee from avion , vol 
 where av_id=VO_AVION and av_const= 'Airbus' and VO_SITE_ARRIVEE='Paris';
 -- nom des pilotes en service
 select distinct pi_id,pi_nom from pilote, vol where pi_id = vo_pilote;
 -- Nom des avions (BOEING) ayant une même capacité (auto-jointure)
 select av.av_id,av.av_const,av.av_capacite  from avion av, avion av2 where av.av_id!=av2.av_id
 and av.av_const = 'Boeing' and av2.av_const = 'Boeing' and av.av_capacite=av2.av_capacite;
 -- nombre d'avions de chaque marque
 select COUNT(av_id),av_modele from avion group by av_modele;
 -- Nombre de pilotes différents pour chaque avion en service
 select av_const, count(pi_id),VO_ID from pilote, avion, vol
 where pilote.PI_ID=vol.VO_PILOTE and avion.AV_ID=vol.VO_AVION group by vo_avion;
 -- nombre de vols différents pour chaque pilote (regroupé par nom)
 select count(*),pi_nom from vol , pilote where PI_ID= VO_PILOTE group by pi_nom;
 -- Pilotes (ordre croissant des numéros) assurant plus d’un vol (Afficher: Numéro et nom des pilotes, nombre de vols)
select pi_id,pi_nom, count(*) as c1 from pilote, vol 
where VO_PILOTE=PI_ID group by vo_pilote having c1  >1 order by pi_id;
-- Nombre de vols assurés au départ de Nice ou de Paris par chaque pilote (Afficher: Numéros des pilotes, ville de départ et nombre de vols)
 select PI_id, vo_site_depart, count(*) from vol, pilote 
 where PI_ID=VO_PILOTE and (VO_SITE_DEPART ='Paris' or VO_SITE_DEPART= 'Nice') group by pi_ID;
 -- Nombre de vols assurés au départ ou à l’arrivée de Nice par chaque pilote (Afficher: Numéros des pilotes, nombre de vols)
 select PI_id, vo_site_depart, vo_site_arrivee, count(vo_id) from vol, pilote 
 where PI_ID=VO_PILOTE and (VO_SITE_DEPART ='Nice' or VO_SITE_arrivee= 'Nice') group by pi_ID;
 -- Liste des vols dont la ville de départ correspond à la ville où est localisé l’avion
 select vo_id,vo_site_depart, av_site from avion, vol
 where av_id=vo_avion
 and vo_site_depart=av_site;
 -- Liste des avions de capacité égale ou supérieure à la moyenne
 select avg(av_capacite) as moyenne, av_id from avion group by av_capacite having av_capacite>=moyenne;
 -- Capacité mini et maxi des BOEING
 select min(av_capacite), max(av_capacite) from avion;
 -- Capacité moyenne des avions localisés à Paris avec 2 chiffres après la virgule
 select avg(av_capacite) from avion where av_site= 'Paris';
 -- Capacité moyenne des avions par marque
 select avg(av_capacite), av_modele from avion group by av_modele;
 -- Capacité totale des avions de la tablea avion
 select sum(av_capacite) from avion;
 -- afficher le système en secondes
select sec_to_time(3600);
 