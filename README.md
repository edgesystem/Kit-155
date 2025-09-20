🔥 Sobre

Kit 155 é um script simples de ligação direta para veículos (hotwire) com animação/progress bar para aumentar a imersividade no servidor. É feito para uso em servidores de roleplay.

Use apenas em ambientes controlados de RP — não incentive ações ilegais no mundo real.

✅ Funcionalidades

Ligação direta do veículo (sem chave) — basta entrar no veículo.

Animação + progress bar para imersão.

Dispara notificação/alerta (ps-dispatch) ao usar.

🧩 Dependências

qbx_core

ox-lib (para notificações)

ox-inventory (registro do item/imagem)

ps-dispatch (dispara alerta de furto quando o kit for usado)

📥 Instalação

Copie o módulo para sua pasta addons (ou diretório equivalente do servidor).

Adicione o item ao ox_inventory (veja o trecho abaixo).

Coloque a imagem 155.png em ox_inventory/web/images.

Reinicie o servidor e teste o item kit155 em qualquer veículo.

📄 Exemplo — adicionar item (ox_inventory/data/items.lua)

Adicione o bloco abaixo em um local apropriado no arquivo items.lua:

["kit155"] = {
    label       = "Kit 155",
    description = "Um Verdadeiro ladrão de carros não vive sem!",
    weight      = 800,
    consume     = 1,
    stack       = true,
    close       = true,
    client = {
        image = "155.png",
        event = "kit155:hotwire:client",   -- apenas dispara este event

    },
},
🖼️ Imagem

Coloque a imagem 155.png em:

ox_inventory/web/images/155.png
⚙️ Uso

Após seguir a instalação: entre em qualquer veículo, use o item kit155 no inventário e o script deve executar a animação/progress bar, ligar o veículo (ou rodar o event configurado) e acionar o ps-dispatch para alertas conforme configurado.

🛡️ Aviso / Ética

Este recurso foi feito para ser usado em servidores de roleplay e ambientes controlados. Não use scripts ou instruções deste tipo para facilitar atividades ilegais na vida real. O autor não se responsabiliza por uso indevido.

✍️ Contribuições

Quer melhorar o script? Abra PRs, sugira animações melhores, integre com outros dispatchs ou ajuste a lógica do progress bar. Mantenha o código organizado e documentado.



📜 Licença

O projeto está sob a Licença MIT — licença permissiva e gratuita.
