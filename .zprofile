if [[ -z "$LC_ALL" ]]; then
  export LC_ALL='en_US.UTF-8'
fi

export PATH="$HOME/.cargo/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
