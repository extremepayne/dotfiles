# How to install


## [Scoop](http://scoop.sh)
`iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`


## Concfg
(to get solarized working)

`scoop install concfg`

`concfg export config-backup.json`

`concfg import solarized-dark basic`

## Some basic dev tools with scoop
`scoop install sudo`

`sudo scoop install 7zip git openssh --global`

`scoop install curl vim grep less touch`

Also install whatever language you're working in.
#### Java
`scoop bucket add java` `scoop install adopt12-hotspot-jre`
#### Python
`scoop install python`
