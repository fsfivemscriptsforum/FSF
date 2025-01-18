fx_version 'cerulean'
game 'gta5'
lua54 'yes' 

author 'FSF'
description 'Safezone Script ox_lib-al'
version '1.1'

client_script {
    'config.lua',
    'client.lua'
}

shared_script '@ox_lib/init.lua' 

dependencies {
    'ox_lib' 
}