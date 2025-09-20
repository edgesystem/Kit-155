fx_version 'cerulean'
game 'gta5'
lua54 'yes'  
author 'Thug Developer - Edge System --> https://discord.gg/PetxZ3yXjZ'
description 'Ferramenta de ligação direta'

dependencies {
    'ox_lib',        
    'qbx_core'       
}
shared_scripts {
    '@ox_lib/init.lua',             
    '@qbx_core/modules/lib.lua',    
}
client_scripts {
    '@qbx_core/modules/playerdata.lua',  
    'client.lua',                        
}

