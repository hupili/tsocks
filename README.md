# TSocks for Brew

Formula copied from [homebrew#11870](https://github.com/Homebrew/homebrew/issues/11870)

## Installation

```
brew install --HEAD tsocks.rb
```

## Usage

Default proxy is `localhost:10080`.
Edit the configuration:

```
vim $(brew --prefix)/etc/tsocks.conf
```

Example:

```
tsocks curl ifconfig.me
```

## License

Original: GPL

This repo: GPL

