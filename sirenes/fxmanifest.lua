name "Emergency Siren Control"
author "glitchdetector"
contact "glitchdetector@gmail.com"
version "1.0"
download "https://github.com/glitchdetector/fivem-emergency-siren-control"

details [[
    Originally created for Transport Tycoon by glitchdetector
    Entity enumerator by IllidanS4
    Standalone-ized for release on the CitizenFX Forums
]]

usage [[
    Any vehicle with emergency lights will be silent by default
    You can press the Cinematic Camera button while lights are enabled to toggle the siren
    Siren does not sound if no-one is in the driver seat of the vehicle
]]

description "A custom siren control system, based on native methods"

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