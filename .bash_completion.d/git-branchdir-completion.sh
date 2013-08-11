#!/usr/bin/env bash

_git_branchdir ()
{
    local subcommands="list path new move delete merge publish"
    local subcommand="$(__git_find_on_cmdline "$subcommands")"
    if [ -z "$subcommand" ]; then
        __gitcomp "$subcommands"
        return
    fi

    case "$subcommand" in
    move|delete|merge|path)
        __git_one_branchdirs
        return
        ;;
    publish)
        __git_two_branchdirs
        return
        ;;
    *)
        COMPREPLY=()
        ;;
    esac
}

__git_one_branchdirs() {
    local cur words cword prev
    _get_comp_words_by_ref -n =: cur words cword prev
    if [ $cword -eq 3 ]; then
        __gitcomp "$(__git_branchdir_list_branchdirs)"
    fi
    return
}

__git_two_branchdirs() {
    local cur words cword prev
    _get_comp_words_by_ref -n =: cur words cword prev
    if [ $cword -eq 3 ] || [ $cword -eq 4 ]; then
        __gitcomp "$(__git_branchdir_list_branchdirs)"
    fi
    return
}

__git_branchdir_list_branchdirs() {
    git branchdir list
}

# alias __git_find_on_cmdline for backwards compatibility
if [ -z "`type -t __git_find_on_cmdline`" ]; then
    alias __git_find_on_cmdline=__git_find_subcommand
fi
