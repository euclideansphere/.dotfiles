setup your ssh key first

```bash
ssh-keygen -t rsa -b 4096 -C "austinhartline@gmail.com"
# follow the steps, use a passphrase
ssh-add ~/.ssh/id_rsa

# copy key from terminal to clipbord
cat ~/.ssh/id_rsa.pub
# or if you have xclip and it actually works
xclip -sel clip < ~/.ssh/id_rsa.pub
```

```bash
git clone git@github.com:euclideansphere/.dotfiles.git ~/.dotfiles
pushd ~/.dotfiles && ./setup.sh
popd
```
