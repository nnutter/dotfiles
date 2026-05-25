# config.nu
#
# Installed by:
# version = "0.112.2"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.cursor_shape = {
  vi_insert: line
  vi_normal: block
}
$env.prompt_indicator_vi_insert = ""
$env.prompt_indicator_vi_normal = ""
$env.config.keybindings ++= [{
  name: insert_last_token
  modifier: alt
  keycode: char_.
  mode: vi_insert
  event: [
    { edit: InsertString, value: "!$" }
    { send: Enter }
  ]
}]

$env.editor = 'nvim'
$env.git_editor = 'nvim'

$env.homebrew_prefix = "/home/linuxbrew/.linuxbrew"
$env.homebrew_cellar = $"($env.homebrew_prefix)/Cellar"
$env.homebrew_repository = $"($env.homebrew_prefix)/Homebrew";

$env.INFOPATH = ($env.INFOPATH? | default []) ++ [$'($env.homebrew_prefix)/share/info']

use std/util "path add"
path add $'($env.home)/.cargo/bin'
path add $'($env.home)/.go/bin'
path add $'($env.home)/.lmstudio/bin'
path add $'($env.home)/.local/bin'
path add $'($env.home)/bin'
path add $'($env.homebrew_prefix)/bin'
path add $'($env.homebrew_prefix)/sbin'
