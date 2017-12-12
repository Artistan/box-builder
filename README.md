
# Box Builder [including Homestead Settler box]
### make your own image!
[![GitHub release](https://img.shields.io/github/release/Artistan/homstead-builder.svg)](https://github.com/Artistan/homstead-builder/releases)

Create your own image quickly by just checking out this repo and running

Suggestions welcome!

## Install


### Dependancies

```bash

brew install packer git
brew cask install vagrant
brew cask virtualbox-extension-pack
vagrant plugin install vagrant-bindfs
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-vbguest

```

### Repository

```bash

# clone this repository
git clone https://github.com/Artistan/homestead-builder.git ~/homestead-builder
cd ~/homestead-builder

```

### Build a Box

```
# run a build for a new image.
./build.box.sh homestead

---------------------- OR ----------------------

# build a different named box, see homestead/configs/README.md
./build.box.sh redis
```

running this will build a vagrant box into the bento/builds directory and add it to your local vagrant boxes.

###  Using with [Homestead](https://laravel.com/docs/5.5/homestead)

Just add these lines to your [`Homestead.yaml`](https://github.com/laravel/homestead) file to use your customized local box

```
box: "homestead"
version: ">= 0"
```

## Where to customize

If the git repos are already downloaded, you can customize the scripts and then run the builds again.

Add new boxes in `./homestead/configs/{boxname}`

[@see](https://github.com/Artistan/box-builder/tree/master/homestead/configs) `./homestead/configs/Readme.md`

#### Homestead updates

While we will try to keep the homestead script up to date, you may get it from the original settler homestead development environment repo.
https://github.com/laravel/settler

#### Base Image
if you run a box, it creates a json file. you may edit that if you need to customize the json further
```json
  "variables": {
    "cpus": "1",
    "disk_size": "60960",
    "http_proxy": "{{env `http_proxy`}}",
    "https_proxy": "{{env `https_proxy`}}",
    "hyperv_generation": "2",
    "hyperv_switch": "{{env `hyperv_switch`}}",
    "memory": "1024",
    "no_proxy": "{{env `no_proxy`}}",
  }
```

## Contributing
We'd love you to contribute to Box Builder. Fork the repo and do a pull request.

## Who Are You?
Box Builders's lead maintainer is [Charles Peterson](https://github.com/Artistan).

## License
Code is under the MIT.

