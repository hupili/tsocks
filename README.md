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

## Caveats

This is recently (How recent? See commits) tested on OSX 10.9.4.
Here are some known caveats:

   * If you have `/lib` dir,
   the `libtsocks??.dylib` files will be installed there,
   instead of the intended `$(brew --prefix)/Cellar/tsocks/HEAD/lib`
