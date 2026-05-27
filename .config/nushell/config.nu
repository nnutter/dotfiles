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

$env.EDITOR = 'nvim'
$env.GIT_EDITOR = 'nvim'

# Installs Go tools, packages, etc. in ~/.go instead of the default, ~/go.
$env.GOPATH = $"($env.HOME)/.go"
# Disables some public security checks on our private Go packages.
$env.GOPRIVATE = "code.cbbapps.com"

$env.MISE_EXPERIMENTAL = 1

$env.HOMEBREW_PREFIX = "/home/linuxbrew/.linuxbrew"
$env.HOMEBREW_CELLAR = $"($env.HOMEBREW_PREFIX)/Cellar"
$env.HOMEBREW_REPOSITORY = $"($env.HOMEBREW_PREFIX)/Homebrew";

$env.INFOPATH = ($env.INFOPATH? | default []) ++ [$'($env.HOMEBREW_PREFIX)/share/info']

use std/util "path add"
path add $'($env.HOME)/.cargo/bin'
path add $'($env.HOME)/.go/bin'
path add $'($env.HOME)/.lmstudio/bin'
path add $'($env.HOME)/.local/bin'
path add $'($env.HOME)/bin'
path add $'($env.HOMEBREW_PREFIX)/bin'
path add $'($env.HOMEBREW_PREFIX)/sbin'
