## Installation

You will need to have `ruby` in your `PATH` for `rcli` to work.

Once you have that out of the way, here's one way you could install `rcli` in your `$HOME` directory:

    cd
    git clone https://github.com/tansengming/rcli.git .rcli

For bash users:

    echo 'eval "$($HOME/.rcli/bin/rcli init -)"' >> ~/.bash_profile
    exec bash

For zsh users:

    echo 'eval "$($HOME/.rcli/bin/rcli init -)"' >> ~/.zshenv
    source ~/.zshenv

You could also install `rcli` in a different directory, say `/usr/local`.

## Usage

`rcli` comes with a few commands and you'll probably want to get started with `rcli login` to generate a [Personal Access Token](https://github.com/recursecenter/wiki/wiki/Recurse-Center-API#personal-access-tokens).

### rcli login

```bash
Usage: rcli login

Creates a personal access token and saves it to ~/.rclirc
```


### rcli profiles

```bash
Usage: rcli profiles QUERY

Search for profiles on the RC directory based on QUERY

Where QUERY will search by name, skills, profile questions. 
An empty QUERY will cause results to be returned alphabetically 
by last name. E.g.

   rcli profiles 'sengming'

Searches name, skills and profile questions for mention of 'sengming'
```

### rcli help

```bash
Usage: rcli help <command>

See 'rcli help <command>' for information on a specific command.
```

## Updates

If you've cloned the repository to `~/.rcli` you can get the latest updates with:

    cd ~/.rcli
    git pull