## Installation

Here's one way you could install your sub in your `$HOME` directory:

    cd
    git clone https://github.com/tansengming/rcli.git .rcli

For bash users:

    echo 'eval "$($HOME/.rcli/bin/sub init -)"' >> ~/.bash_profile
    exec bash

For zsh users:

    echo 'eval "$($HOME/.rcli/bin/rcli init -)"' >> ~/.zshenv
    source ~/.zshenv

You could also install your sub in a different directory, say `/usr/local`. This is just one way you could provide a way to install your sub.