fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'qr-SmallResources'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

server_script 'server/*.lua'
client_script 'client/*.lua'
lua54 'yes'