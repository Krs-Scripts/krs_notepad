fx_version "cerulean"
use_fxv2_oal "yes"
lua54 "yes"
game "gta5"
version "1.0.0"
description "A simple notepad system"
name 'krs_notepad'
author "karos7804"

shared_script {
    '@ox_lib/init.lua',
    "@es_extended/imports.lua"
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

exports {
    'notepad_saved',
    'notepad'
}