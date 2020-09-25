<div align="center">

# asdf-hamler ![Build](https://github.com/scudelletti/asdf-hamler/workflows/Build/badge.svg) ![Lint](https://github.com/scudelletti/asdf-hamler/workflows/Lint/badge.svg)

[hamler](https://github.com/hamler-lang/documentation) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `erlang`

# Install

Plugin:

```shell
asdf plugin add hamler
# or
asdf plugin add https://github.com/scudelletti/asdf-hamler.git
```

hamler:

```shell
# Show all installable versions
asdf list-all hamler

# Install specific version
asdf install hamler latest

# Set a version globally (on your ~/.tool-versions file)
asdf global hamler latest

# Now hamler commands are available
hamler --version
```

# Notes:

Versions lower than `0.2.2` rely in fixed lib directory outside the asdf installation. So you'll need to link them manually.

More specifically:
* Linux: `/usr/lib/hamler`
* MacOS: `/usr/local/lib/hamler`

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/scudelletti/asdf-hamler/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Diogo Scudelletti](https://github.com/scudelletti/)
