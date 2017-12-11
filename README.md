## this needs updated since settler changed how they are building

# Box Builder [including Homestead]
### make your own image!
[![GitHub release](https://img.shields.io/github/release/Artistan/homstead-builder.svg)](https://github.com/Artistan/homstead-builder/releases)

Create your own image quickly by just checking out this repo and running

Suggestions welcome!

## Install
```bash
brew install packer git
brew cask install vagrant
brew cask virtualbox-extension-pack
vagrant plugin install vagrant-bindfs
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-vbguest

# clone this repository
git clone https://github.com/Artistan/homestead-builder.git ~/homestead-builder
cd ~/homestead-builder

# run a build for a new image. (auto clones repos) Forces both boxes to build
./build.box.sh homestead

---------------------- OR ----------------------

# build a different named box, see homestead/configs/README.md
./build.box.sh redis

```

## Where to customize

If the git repos are already downloaded, you can customize the scripts and then run the builds again.

Add new boxes in ./homestead/configs/{boxname}

@see ./homestead/configs/Readme.md

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
We'd love you to contribute to Brew Cooler. Fork the repo and do a pull request.

## Who Are You?
Homestead Builders's lead maintainer is [Charles Peterson](https://github.com/Artistan).

## License
Code is under the MIT.

