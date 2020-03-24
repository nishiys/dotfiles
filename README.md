# dotfiles

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
```

### How to create the backup and restore it

```
pip freeze > requirements.txt
```
creates requirements.txt in freeze format.

When you restore them in another environment;

```
pip install -r requirements.txt
```
