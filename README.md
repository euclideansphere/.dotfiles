# dotfiles

## setup your ssh key first

```bash
ssh-keygen -t rsa -b 4096 -C "austinhartline@gmail.com"
# follow the steps, use a passphrase
ssh-add ~/.ssh/id_rsa

# copy key from terminal to clipbord
cat ~/.ssh/id_rsa.pub
```

symlink things you want. periods removed from file nodes in this repo for vis so paths may not be accurate


```sh
ln -sv $pwd/$file $HOME/$file
```

