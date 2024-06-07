> [!TIP]
> in certain debian installations, there may be an issue where executing `localectl list-keymaps`
> doesn't yield any results. in such instances, the solution is download the latest
> `kbd` package from a [mirror](https://mirrors.edge.kernel.org/pub/linux/utils/kbd/),
> extracting it, and then copying `kbd/data/keymaps/` to `/usr/share/kbd/`.

> [!TIP]
> em notebooks thinkpad com teclado pt-br é nescessario fazer adicao do layout kbd-thinkpad-br
> que pode ser encontrado atraves do [pacote aur](https://aur.archlinux.org/packages/kbd-br-thinkpad)
> [¹](https://plus.diolinux.com.br/t/configurando-teclado-br-de-um-thinkpad-no-arch/57563)
> on thinkpad laptops with an pt-br keyboard, you need to add the kbd-thinkpad-br
> keyboard layout to /? keys work properly, which can be found in the
[aur package](https://aur.archlinux.org/packages/kbd-br-thinkpad).

> [!TIP]
> para gerar `fish-completions` de forma global para todo o sistema é nescessario utilizar o comando<br>
> `fish_update_completions --directory /usr/share/fish/completions/ --progress` que ira armazenar as completions
> no 'diretorio global do fish'
