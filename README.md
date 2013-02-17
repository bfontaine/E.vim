E.vim
=====

This is a Vim syntax file for the [E][e-website]
language.

Install
-------

```bash
wget https://raw.github.com/bfontaine/E.vim/master/e.vim \
    -O ~/.vim/syntax/
```

Add the following line to your `.vimrc`:

```vim
au BufNewFile,BufRead *.e set ft=e
```

[e-website]: http://www.erights.org/e/e-goals.html
