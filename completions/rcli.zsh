if [[ ! -o interactive ]]; then
    return
fi

compctl -K _rcli rcli

_rcli() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(rcli commands)"
  else
    completions="$(rcli completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
