# dotfiles
## gitignore
```shell
# create .gitignore and add it
# delete already existing caches of files which you want to ignore hereafter
# [あとからまとめて\.gitignoreする方法 \- Qiita](https://qiita.com/yuuAn/items/b1d1df2e810fd6b92574)
git rm --cached `git ls-files --full-name -i --exclude-from=.gitignore`
```
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

### zplug
install zplug

```
curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
```



