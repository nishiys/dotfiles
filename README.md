# dotfiles

## Homebrew
### backup & restoration
```shell
# backup installed package list as a Brewfile (--force: overwrite the existing file)
brew bundle dump --force
```
```shell
# restore
brew bundle
```


## pip
### update & upgrade
In terms of dependencies, automatic update is not provided by default.

```shell
# list outdated packages
pip list -o
# update pip
pip install -U pip
# update a package
pip install -U package_name
# install the specific version of the package
pip install package_name==version
# check dependency violation
pip check
```

### backup & restoration

```shell
# creates requirements.txt in freeze format.
pip freeze > requirements.txt
```
```shell
# restore
pip install -r requirements.txt
```
