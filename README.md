# ESC
### [Script original ici](https://github.com/glitchdetector/fivem-emergency-siren-control)
Projet basé sur Emergency-Siren-Control permettant de définir des sirènes sur tous les véhicules non-ELS.

Pour utilisé ce plugin il suffit d'ajouté les noms des véhicules ainsi que le nom de la sirène correspondante dans le config.lua, ainsi vous pourrez mettre n'importe quel son de moteur sur le véhicule (`<audioNameHash>` dans le fichier `vehicle.meta`)  il aura la possibilité d'avoir les gyrophare ainsi que la sirène activable séparément tout en ayant un son de moteur réaliste !

Pour comprendre comment configurer les sirènes et à quel fichier du `RESIDENT.RPF` cela correspond je vous conseil [ce thread](https://www.lcpdfr.com/downloads/gta5mods/misc/33460-updated-siren-hashes-for-els-2021/).

Pour activer/désactiver l'interface graphique du plugin changez la valeur ci dessous dans le config.lua
```
Config.UI = true
```

Pour ajouter un véhicule définissez le nom de spawn dans le champ `name` et le nom de la sirène dans le champ `sirene`,

Pour ajouter de nouveaux véhicules, il suffit de copier --> coller une ligne et de remplacer le contenu. 

```
Config.Vehicules = {
    {name = 'ambulance', sirene = 'VEHICLES_HORNS_AMBULANCE_WARNING'},
    {name = 'alpinegn', sirene = 'VEHICLES_HORNS_SIREN_2'},

}
```

## Voici une liste des sirènes du jeu, il peut y avoir des variations en fonction du pack de son que vous utilisez

Shema :
Hash à mettre dans le champ `sirene` --> Correspondance de sirène --> Nom du fichier dans le `RESIDENT.RPF`

```


VEHICLES_HORNS_AMBULANCE_WARNING --> Sirène SAMU Nom de fichier --> AMBULANCE_WARNING
VEHICLES_HORNS_POLICE_WARNING --> Sirène Gendarmerie Nationale Nom de fichier --> POLICE_WARNING 
VEHICLES_HORNS_SIREN_1 --> Police Nationale  Nom de fichier --> SIREN_PA20A_WAIL 
VEHICLES_HORNS_SIREN_2 --> Sapeurs Pompiers Nom de fichier --> SIREN_2 
SIRENS_AIRHORN --> Wail Americain principal (maintiens klaxon pendant sirene) Nom de fichier --> AIRHORN_EQD 
VEHICLES_HORNS_FIRETRUCK_WARNING --> Wail Americain camion de pompier (maintiens klaxon pendant sirene) Nom de fichier --> FIRE_TRUCK_HORN 

RESIDENT_VEHICLES_SIREN_WAIL_01 --> Sirène SAMU Nom de fichier --> SIREN_WAIL_01
RESIDENT_VEHICLES_SIREN_WAIL_02 --> Sirène PN Nom de fichier --> SIREN_WAIL_02
RESIDENT_VEHICLES_SIREN_WAIL_03 --> Sirène Nom de fichier --> SIREN_WAIL_03

RESIDENT_VEHICLES_SIREN_QUICK_01 --> Sirène Nom de fichier --> SIREN_QUICK_01
RESIDENT_VEHICLES_SIREN_QUICK_02 --> Sirène Nom de fichier --> SIREN_QUICK_02 
RESIDENT_VEHICLES_SIREN_QUICK_03 --> Sirène GN Nom de fichier --> SIREN_QUICK_03

sirens_slow_dir6 --> Sirène Granger Principale --> SIREN_WAIL_04
fast_9oghrv3 --> Sirène Granger Secondaire --> SIREN_QUICK_04

RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01 --> Sirène Sapeurs  Nom de fichier --> SIREN_FIRETRUCK_WAIL_01
RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01 --> Sirène Nom de fichier --> SIREN_FIRETRUCK_QUICK_01
```

## + d'infos concernants les sirènes [ici](https://www.lcpdfr.com/downloads/gta5mods/misc/33460-updated-siren-hashes-for-els-2021/)

