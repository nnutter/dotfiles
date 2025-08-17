#!/usr/bin/env bash

# Original notes on this are at https://gist.github.com/nnutter/42a83f2a0479c9a53b813b3c49eff09d.
#
# TODO:
#   - Add help docs.
#   - Add subcommand to install roam.sh permanently.
#   - Add subcommand to complete roam as git for bash and zsh:
#       - `complete -F _git roam` for bash. In the past it looks like I also used
#           the options, `-o bashdefault -o default -o nospace`.
#       - `compdef roam=git` for zsh

_roam() {
	git --git-dir "$HOME/.dotfiles.git" --work-tree "$HOME" "$@"
}

setup-checkout() {
	_roam checkout "$1"
}

setup-init() {
	_roam init
	_roam config status.showUntrackedFiles no
}

setup-remote() {
	_roam remote add -f origin git@github.com:"$1".git
}

setup() {
	# shellcheck disable=1090
	source "$(git --exec-path)/git-sh-setup"

	local branch="master" opt="" repo="$USER/dotfiles"
	while [ $# -gt 0 ]; do
		opt="$1"
		shift
		case $opt in
			--) break;;
			-b) branch="$1"; shift;;
			-r) repo="$1"; shift;;
		esac
	done

	setup-init
	setup-remote "$repo"
	setup-checkout "$branch"
}

main() {
	case "$1" in
		setup)
			shift;
			setup "$@";;
		*)
			_roam "$@";;
	esac
}

# shellcheck disable=SC2034
# NONGIT_OK is used by `git-sh-setup`.
NONGIT_OK=1

# shellcheck disable=SC2034
# OPTIONS_SPEC is used by `git-sh-setup`.
OPTIONS_SPEC="\
roam setup [-r <repo>] [-b <branch>]

Otherwise use roam like git.
--
h,help     show the help
r,repo=    repo name (default: $USER/dotfiles)
b,branch=  branch name (default: master)
"

main "$@"
