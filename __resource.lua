resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_script 'client.lua'

-- Sound Related
client_script 'client/main.lua'
server_script 'server/main.lua'

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/sounds/click.ogg',
})