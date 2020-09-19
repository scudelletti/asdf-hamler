<div align="center">

# asdf-hamler ![Build](https://github.com/scudelletti/asdf-hamler/workflows/Build/badge.svg) ![Lint](https://github.com/scudelletti/asdf-hamler/workflows/Lint/badge.svg)

[hamler](https://github.com/hamler-lang/documentation) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

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

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/scudelletti/asdf-hamler/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Diogo Scudelletti](https://github.com/scudelletti/)
