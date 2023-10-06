fx_version 'adamant'

game 'gta5'
author 'struzzoxz'
version '1.00'
description 'Radio Anim by struzzoxz'
lua54 'yes'
shared_script {'@es_extended/imports.lua'}
client_scripts { 'client.lua'}
server_scripts {'server.lua'}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/js/*.js',
    'nui/css/*.css',
    'nui/img/*',
    'nui/img/.mp4',
    'nui/fonts/*'
}
