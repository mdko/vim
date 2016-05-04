From [this site](http://www.foldling.org/scheme.html#editing-scheme-with-vim)

2013-01-18 Editing Scheme with Vim
==================================

For other weirdos like me who refuse to use Emacs.

Indentation
-----------

Vim’s built-in Lisp indentation (“`set lisp`”) is hardcoded to shift inner
forms by two spaces. I much prefer the indentation style used by the various
emacsen, where identifiers not in `lispwords` are vertically aligned;
[this patch](http://www.foldling.org/~evhan/patches/vim73-lisp-indent.patch)
against Vim 7.3 emulates this style.

Alternatively, use my [schematic-format](http://foldling.org/git/schematic.git)
utility for a quite opinionated source formatter. Once installed, use it as
Vim’s = operator for Scheme files with the following configuration:

  au FileType scheme setl equalprg=schematic-format

Lispwords
---------

If you choose not to use an `'equalprg'`, getting lispwords right eases a lot of
manual-indentation pain. Most important is…

  au FileType scheme setl lispwords-=if

… To vertically align the arms of `if` expressions with their tests.

Syntax
------

Vim colors parentheses as `Delimiter`s by default, which is too bright for my taste
in most colorschemes. Additionally, I like to have a visual indication of which
parentheses are parts of quoted forms, as opposed to normal code.
[This patch](http://www.foldling.org/~evhan/patches/vim73-scheme-syntax.patch) colors
“normal” parentheses as `Comment`s (which are light grey in my colorscheme), while
parentheses in `quote` and `quasiquote` forms remain colored as `Delimiter`s (red, with
inner unquotes returning parentheses to the lighter `Comment` color).

I also maintain a reasonably complete [scheme.vim](http://www.foldling.org/~evhan/misc/scheme.vim)
for the R7RS and [chicken.vim](http://www.foldling.org/~evhan/misc/chicken.vim) for CHICKEN’s
extensions to the language. To use them, place them in `$HOME/.vim/syntax/` and
`$HOME/.vim/after/syntax/`, respectively.

REPL
----

I’ve written about simple REPL integration here (included inline):

I’m not an Emacs user and I don’t care for slimv, but the ability to send text from
$EDITOR to a running REPL a la SLIME is invaluable. For a while I used a modified
version of tslime.vim, but I’ve since ditched it for something much simpler.

In sh(1):

  mkfifo repl
  cat > repl & $command < repl

In vim(1):

  nmap <C-c><C-c> vap:w >> repl<CR>

That’s it. `^C^C` sends the toplevel expression under the cursor to the `$command` reading
from repl, no plugins or external tools are needed, and concerns are separated correctly:
the editor and repl are isolated by pty and the view is managed by the window manager,
as it should be.

Plugins
-------

Surround
--------

If you use [vim-surround](https://github.com/tpope/vim-surround), the following line adds
a binding to the s key that surrounds forms in a function application, so that, for example,
yssscons wraps the current line in `(cons ...)`.

  let g:surround\_115 = "(\1function: \1 \r)"

Smart Input
-----------

[lexima](https://github.com/cohama/lexima.vim) is the best autoclose plugin I’ve found so far.
It’s based on the solid [vim-smartinput](https://github.com/kana/vim-smartinput), but provides
the added benefit of dot-repeatable insertions.

It also works well for Scheme, with minor customization. The following lines in `$HOME/.vimrc` prevents it from autoclosing quote and quasiquote characters:

  call lexima#add\_rule({ 'char': "'",  'input': "'", 'filetype': ['lisp', 'scheme'] })
  call lexima#add\_rule({ 'char': "`",  'input': "`", 'filetype': ['lisp', 'scheme'] })

Chicken
--------

Documentation
-------------

Setting `keywordprg` gives you access to [chicken-doc](https://api.call-cc.org/doc/chicken-doc)’s
documentation for a given identifier when `K` is pressed over it.

  setl keywordprg=chicken-doc

Completion
----------

Vim
---

The following script dumps function names from chicken-doc into files named by
node under `$HOME/.vim/completion/scheme`.

  #!/bin/sh

  set -e

  dir="$HOME/.vim/completion/scheme"

  first() { cut -d' ' -f1; }

  mkdir -p $dir
  for n in $(chicken-doc -c chicken | first); do
    chicken-doc -c chicken $n | first | tee $dir/chicken-$n
  done

  for n in $(chicken-doc -c | first); do
    [ "$n" = "chicken" ] && continue
      chicken-doc -c $n | first | tee $dir/$n
  done

These files can be sourced to add completion for Chicken identifiers by adding the
following to `$HOME/.vim/ftplugin/scheme.vim`:

  setl complete+=d,k~/.vim/completion/scheme/\*\*

Obviously, the same could be done for any other language, given a way to generate
its wordfile(s).

csi
---

The same wordfiles can be used for tab completion in `csi` with `rlwrap`.

      cat $HOME/.vim/completion/scheme/* > $HOME/.csi-words
      alias csi="rlwrap -b'(){}[]\";' -q'\"' -f$HOME/.csi-words csi"
