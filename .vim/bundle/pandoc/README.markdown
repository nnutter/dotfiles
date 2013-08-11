*pandoc.txt* 	For Vim version 7.3 	Last change: 2011 Sep 05

[This document is formatted as a markdown file _and_ as a vim helpfile.
If viewing from within vim, set ft=help to view it as a helpfile, and
set ft=pandoc to view it as a (pandoc) markdown file.]

Vim Plugin for *pandoc*
=======================

This is a bundle for writing and editing documents in [pandoc][]'s
[extended markdown][]. It provides

-   some settings to make vim a pleasant |pandoc-writing-environment|,
-   |pandoc-syntax-highlighting|, with support for pandoc's extended
     markdown,
-   |pandoc-snippets| for use with [snipMate][],
-   |pandoc-section-folding|,
-   |pandoc-citation-completion|,
-   some simple |pandoc-conversion-functions| and |pandoc-tidying-functions|,
-   a few |pandoc-localleader-mappings|

Download and Install
====================

For the latest version, see <https://github.com/vim-pandoc/vim-pandoc>.

There are many different ways to manage and install vim plugins. Use
your favorite method. If you don't have a favorite method, we recommend
using [Pathogen][].

Once you have Pathogen installed, clone this epository into your
``~/.vim/bundle` directory,

    cd ~/.vim/bundle
    git clone git@github.com:vim-pandoc/vim-pandoc.git

Or, if that seems too complicated, install Pathogen and then install
[Vimmer][], a ruby gem for managing vim plugins, with

    gem install vimmer

Then run

    vimmer install https://github.com/vim-pandoc/vim-pandoc.git

Either way, this will install the bleeding edge development version
of the plugin. If you want something more stable,

    cd ~/.vim/bundle/vim-pandoc
    git tag

This should list the "tags" that correspond to released versions, e.g.,
'2.0.' To use version 2.0,

    git checkout 2.0

To return to the most recent development version,

    git checkout master
 
If you don't want to (or can't) use git, you can download a tarball from
the github page and unzip it into \~/.vim/bundle.

Filetype Detection and File Extensions
======================================

If you have this plugin installed alongside [vim-markdown][], be aware
that both plugins attempt to claim the common markdown extensions for
their own. We match the following extensions:

+    .markdown, .md, .mkd, .pd, .pdk, .pandoc, and .text

In our experience, vim-pandoc trumps vim-markdown.

We do not claim files with the `.txt` extension, since that would seem
a bit presumptuous. If you want `.txt` files to be treated as pandoc
files, add

    au BufNewFile,BufRead *.txt   set filetype=pandoc

to your `.vimrc`.

*pandoc-writing-environment*
===========================

The bundle sets the following options, in an effort to provide a
pleasant writing environment:

    setlocal linebreak
    setlocal breakat-=*

|linebreak| tells vim to break lines at word boundaries. The |breakat|
setting is to account for asterisks used for emphasis.

    nnoremap <buffer> j gj
    nnoremap <buffer> k gk
    vnoremap <buffer> j gj
    vnoremap <buffer> k gk

These mappings allow use of j and k to move up and down in the middle of
a soft-wrapped line.

    setlocal display=lastline

If you are using soft-wrapping, this will tell vim to go ahead and
show part of a long line that runs off the bottom of the screen.

    setlocal nojoinspaces

|nojoinspaces| allows you to use SHIFT-J in normal mode to join the next
line with the current line without adding extra unwanted spaces.

    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->

tells vim to use HTML style comments in your markdown files. For more, see
|comments| and |commentstring|.

*pandoc-hard-wrapping*
----------------------

By default, the bundle assumes that you will be using soft wrapping, and
applies

    setlocal formatoptions=1

If you prefer hard wrapping, set g:pandoc_use_hard_wraps, i.e., put
something like

    let g:pandoc_use_hard_wraps = 1

in your vimrc. When that is set, the bundle instead sets

    setlocal formatoptions=tn

If you also want autoformatting, set g:pandoc_auto_format:

    let g:pandoc_auto_format = 1

in your vimrc. For more information, see |formatoptions|. (Note that
autoformatting can slow things down.)

*pandoc-syntax-highlighting*
============================

The syntax highlighting should be fairly accurate and complete. By
default, the bundle tries to be smart, and only highlight implicit links
if there is a matching link definition. This can be expensive on large
files and slow things down. To disable it, set
g:pandoc_no_empty_implicits:

    let g:pandoc_no_empty_implicits = 1

Due to the way they are handled, span elements (emphasis, bold, tt, subscript
and superscript) can cause slowdowns. If you desire to disable highlighting of
them altogether, set g:pandoc_no_spans:

    let g:pandoc_no_spans = 1

Note that this will also disable highlighting of embedded html, because
otherwise stuff like `<code>` (which is unformatted) is detected as containing
html that doesn't end.

*pandoc-snippets*
=================

If you use |snipMate|, take a look at snippets/pandoc.snippets to see what
is available. Here are a couple of examples:

-   type `%%<TAB>` to generate a title block, with the filename as
    title, the value of `g:snips_author` as author, and the current
    date.
-   type `[*<TAB>` to generate an inline link with the contents of the clipboard
    as the url.

*pandoc-section-folding*
========================

The bundle tells vim to fold documents by section. If you haven't used
folding before, see |fold-commands|.

Folding can slow things down. To disable it, set
g:pandoc_no_folding:

    let g:pandoc_no_folding = 1

For more powerful folding and outline support, use [VOoM][]. If you are using
VOoM, you can use `<localleader>o` to open it in markdown mode when editing a
pandoc file.

*pandoc-citation-completion*
============================

*pandoc-bibfiles*
-----------------

In order to complete citation keys, we need to know the location of your
bibliographical database. When opening a file, we try to find something
appropiate. We look in various places for files with the extension `.bib`, 
`.biblatex` (BibTeX), `.mods` (MODS), `.ris` (RIS), or `.json` (citeproc's
JSON), in that order. We add them to a buffer-local variable called
b:pandoc_bibfile.

If you want, you can set a default bibliography to add to this list by
putting something like

    let g:pandoc_bibfiles = ['/the/path/to/your/bibtex/file.bib']

in your vimrc.

You can set b:pandoc_bibfiles and g:pandoc_bibfiles to any format citeproc-hs
supports.

*Please note the following regarding the searches we perform in order to
determine the value of b:pandoc_bibfiles*: The first place we look is in the
directory that contains the file in the current buffer. In that directory, we
first look for a file that shares the same basename as the file in the current
buffer, but with a bibfile extension. So, for example, if you are editing

    /some/long/path/to/your/file.markdown

we will look for

    /some/long/path/to/your/file.bib
    /some/long/path/to/your/file.biblatex
    /some/long/path/to/your/file.xml

and so on. If no such file is in the directory, we then look for a file
named `default` with an appropriate extension.

If we can't find anything in the directory of file in the current buffer,
we proceed to look for files named `default` with an appropriate extension
in your pandoc data directory (~/.pandoc on POSIX systems). If you want to
use a single global bibliographic database for all your documents, we 
recommend that you put it (or a symlink to it) here.

If we don't find anything in your data directory, we look in your local
texmf tree, using the path specified by

    kpsewhich -var-value TEXMFHOME

Again, we look for a file named `default` with an appropriate extension.

You can always check to see what we've settled on for the buffer by

    :echo b:pandoc_bibfiles

Using Citation Completion
-------------------------

To use completion, start typing a citekey, e.g.,

    @geac

and then, while still in insert mode, hit CTRL-X CTRL-O (vim's shortcut
for |omni-completion|), and you'll get a popup window with a list of
matching keys, e.g.,

    @geach1970   Geach, P. T. – Entailment
    @geach1972   Geach, P. T. – Logic Matters

Regular expressions work too:

    @le.*90

should suggest both '@leftow1990' and '@lewis1990', assuming those are
both keys in your bibliography.

The plugin also provides support for using this with [SuperTab][]. You
will want something like this in your vimrc:

    let g:SuperTabDefaultCompletionType = "context"

Then you can just hit `<TAB>` in the middle of typing a citation
to complete the citation.

|pandoc-use-bibtool|
--------------------

By default, citation completion only matches entries by citekey. If you
have [bibtool][] installed, and your bibliography is a bibtex file, and
you set

    let g:pandoc_use_bibtool = 1

we will match by all keyword in all fields, so that

    @armstrong

might return both

    @armstrong1989    Armstrong, David M. - A Combinatorial Theory of Possibility
    @lewis1992        Lewis, David - Armstrong on Combinatorial Possibility

*pandoc-citation-dictionary*
----------------------------

Omni-completion of citations is quick and powerful. But maybe you just
want dictionary completion of citations? If you create a text file,

    ~/.pandoc/citationkeys.dict

that contains a list of citation keys, one per line, like so

    @adams1967a
    @adams1971
    @adams1972a
    @adams1974
    @adams1977
    @adams1986a

we will add those keys to vim's |dictionary|, allowing for completion by
typing part of a citekey, e.g.,

    @adams19

and then hitting CTRL-X CTRL-K (or via SuperTab).

*pandoc-conversion-functions*
=============================

Pandoc can be used to perform lots of different conversions. We've
made no attempt to provide functions that cover all these possibilities,
since it is easy to do something like

    :!markdown2pdf %

If there is a particular conversion that you do all the time with a
particular set of options, you might want to define a leader mapping
in your vimrc.

*PandocRegisterExecutor*
------------------------

Better yet, you can define a command and a mapping using the
PandocRegisterExecutor command. It tells vim-pandoc to register some
local commands and mappings for a certain set of pandoc parameters. We
call this an executor. The syntax of `PandocRegisterExecutor` is

    :PandocRegisterExecutor NAME MAP TYPE COMMAND

where NAME is the name of the Command, MAP is the mapping for it, TYPE
is the extension of the created file, and COMMAND is a description of
the command to create the document. For example:

    :PandocRegisterExecutor PdcPdf <Leader>pdf pdf markdown2pdf %%

should register a PdcPdf command that runs markdown2pdf on the current
file, and a mapping to do the same, and a PdcPdfOpen command that also
opens the created file, and a mapping to do so, identical to that for
PdcPdf, but followed by a plus sign (that is, the mapping is
`<Leader>pdf+`).

Executors are registered before opening a file.

Executors depend on the `pandoc_execute` function, which can be called
like this:

    :py pandoc_execute(COMMAND, TYPE, OPEN)

where COMMAND is a string describing some pandoc arguments, TYPE is the
extesion of the created file, and OPEN isn flag determining wether to
open the created file or not. COMMAND can include some variables:

1.  `%%` for the current filename
2.  `%:r` for the current filename without the extension
3.  `PANDOC#P_BIBS` for a sequence of --bibliography arguments for every
    value in `b:pandoc_bibfiles`.
4.  `PANDOC#BIBS` for a list of the values in `b:pandoc_bibfiles`.


Those will be evaluated before executing the command, so the user can
define executors that can access those variables. For example:

    :PandocRegisterExecutor PdcPdfB <Leader>pdfb pdf markdown2pdf PANDOC#P_BIBS %%

The value of command in PandocRegisterExecutor and pandoc\_execute can
describe an \*NIX pipeline, like:

    pandoc -t json %% | filter | pandoc -f json -t odt -o %:r.odt

Default executors
-----------------

By default, vim-pandoc provides some handy executors:

-   *PandocPdf* (`<localleader>pdf`), which runs markdown2pdf, passing
    the value of `g:pandoc_bibfile` as the argument of `--bibliography`.
-   *PandocHtml* (`<localleader>html`), which creates a standalone html.
-   *PandocOdt* (`<localleader>odt`), which creates an ODT file, passing
    the value of `g:pandoc_bibfile` as the argument of `--bibliography`.

with their opening variants.

For the mappings to work, you must have |maplocalleader| defined in your
vimrc, e.g.,

    let maplocalleader = ","

Then, for example, you can type something like `,pdf` and a PDF version
of your current buffer will be displayed.

*pandoc-tidying-functions*
==========================

The plugin defines two functions designed for tidying up your markdown:
*MarkdownTidy* and *MarkdownTidyWrap*. Running MarkdownTidyWrap is
equivalent to

    :%!pandoc -t markdown -s

Note that this can have some unexpected effects: it will replace all of
your reference link ids with implicit reference links; it will replace
all of your footnote ids with numbers; it will transform any setext
style headers into atx style headers; it will process any latex macros
you may have defined and delete the macro definitions; if your document
lacks a title block, it will add one.

The plugin also sets

    setlocal equalprg=pandoc\ -t\ markdown\ --reference-links

In practice, this value for |equalprg| makes it easy to hard-wrap
paragraphs nicely, using vim's `=` command. If you prefer soft wrapping,
you might want to change this to

    setlocal equalprg=pandoc\ -t\ markdown\ --reference-links\ --no-wrap

Note that this will *remove* any title block, as well as processing any
custom latex macros. So you might not want to do something like `ggvG=`.

*pandoc-localleader-mappings*
=============================

If |maplocalleader| is defined, vim-pandoc defines a handful of
localleader mappings in addition to |PandocHTMLOpen| et al.

First,

    <localleader>www

when invoked from within a url, like http://example.com, will open that
url in your default browser.

Second, there are two commands for jumping back and forth between a
reference-style link and its definition:

    <localleader>gr
    <localleader>br

`gr` jumps from the link to its definition; `br` jumps back. If you want
to try this out on this document, and you are reading this within vim,
first

    :set maplocalleader = ","
    :set ft=pandoc

then move your cursor [somewhere in here][], and type `,gr`. Wasn't that
fun?[^note] Now you probably want to go ahead and

    :set ft=help

to get back to viewing this as a help file.

[somewhere in here]: http://example.com "Now type `,br` to jump back."
[^note]: Also supports footnotes. Type `,br` to jump back.

Finally, there is

    <localleader>nr

`,nr` creates a new reference definition from within a reference link.
So if you have typed something like

    This is a [link][id]. And here is another sentence.

and type `,nr` from somewhere within `[link][id]`, you will get

    This is a [link][id]. And here is another sentence.

    [id]: <your cursor here>

Of course, when you are done filling in the link, you can hit `,br` to
jump back to where you were.

Known Issues
============

See the github [issues][] page for a current set of issues.

Maintainers
===========

+    [Felipe Morales](https://github.com/fmoralesc/)
+    [David Sanson](https://github.com/dsanson/) 

Thanks also to [Wei Dai][] for bug fixes and improvements.

Borrowings
==========

The syntax file ~~derives from Jeremy Schultz's [pdc.vim][] as
githubbed by [wunki][]~~ has been completely rewritten from the
ground up by Felipe Morales.

The snippets file is a slight extension (and contraction) of the
markdown.snippets file that is part of many of the [vim-markdown
repositories on github][].

Autocompletion was implemented by hacking away at [LaTeX Box][]'s
implementation of bibtex citation completion, even if the results don't
look much like the original.

* * * *

  [pandoc]: http://johnmacfarlane.net/pandoc/
  [extended markdown]: http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown
  [snipMate]: https://github.com/garbas/vim-snipmate
  [Pathogen]: https://github.com/tpope/vim-pathogen
  [Vimmer]: https://github.com/densitypop/Vimmer
  [VOoM]: http://vim-voom.github.com/
  [Wei Dai]: https://github.com/clvv
  [pdc.vim]: http://www.vim.org/scripts/script.php?script_id=2389
  [wunki]: https://github.com/wunki/vim-pandoc
  [vim-markdown repositories on github]: https://github.com/hallison/vim-markdown
  [LaTeX Box]: http://www.vim.org/scripts/script.php?script_id=3109
  [SuperTab]: http://www.vim.org/scripts/script.php?script_id=1643
  [FoldList]: http://www.vim.org/scripts/script.php?script_id=500
  [vim-markdown]: http://plasticboy.com/markdown-vim-mode/
  [issues]: https://github.com/vim-pandoc/vim-pandoc/issues
  [bibtool]: http://www.gerd-neugebauer.de/software/TeX/BibTool/index.en.html


 vim:tw=78:ts=8:ft=help:norl: 

