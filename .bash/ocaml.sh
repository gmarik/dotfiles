#!/bin/sh
#vim: set ft=sh;

if [[ -r $HOME/.opam/opam-init/init.sh ]]; then

  source $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

  # alias ocaml='ledit -h ~/.ocaml_history ocaml' # enable readline in interactive ocaml
fi
