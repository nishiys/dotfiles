# dotfiles

## pip
### How to create the backup and restore it

```
pip freeze > requirements.txt
```
creates requirements.txt in freeze format.

When you restore them in another environment;

```
pip install -r requirements.txt
```
