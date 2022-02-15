name "Emergency Siren Control"
author "glitchdetector & Tech-User42"
contact "glitchdetector@gmail.com"
version "1.1"
download "https://github.com/glitchdetector/fivem-emergency-siren-control"

details [[
    Script permettant d'utiliser des sirènes personnalisées sur n'importe quel véhicule non els !
]]

usage [[
    Configurer les noms des vehicules d'urgences et les sirènes dans le config.lua
]]

description "Script permettant d'utiliser des sirènes personnalisées sur n'importe quel véhicule non els !"

fx_version 'adamant'
game 'gta5'
ui_page 'html/index.html'


client_script 'dep/enumerator.lua'
client_script 'cl_esc.lua'
client_script 'config.lua'
server_script 'server/server.lua'
files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
    'html/img/gyro1.png',
    'html/img/gyro2.png',
    'html/img/sirene.png',
    'html/img/sirene2.png'
}
