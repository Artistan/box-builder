# Homestead Builder
### make your own image!
[![GitHub release](https://img.shields.io/github/release/Artistan/homstead-builder.svg)](https://github.com/Artistan/homstead-builder/releases)

Create your own image quickly by just checking out this repo and running

Suggestions welcome!

## Install
```bash
# requires git and packer
brew install packer git

# clone this repository
git clone https://github.com/Artistan/homestead-builder.git ~/homestead-builder
cd ~/homestead-builder

# run a build for a new image. (auto clones
./homestead.image.sh [optional custom-repo/folder]
```

## Where to customize

If the git repos are already downloaded, you can customize the scripts and then run the builds again.

#### Base Image
bento/ubuntu/ubuntu-16.04-amd64.json
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

#### Homestead Image
settler/virtualbox/Vagrantfile
```
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Configure The Box
  config.vm.box = 'custom-homestead'
  config.vm.hostname = 'homestead'

  # Don't Replace The Default Key https://github.com/mitchellh/vagrant/pull/4707
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  # Configure Port Forwarding
  config.vm.network 'forwarded_port', guest: 80, host: 8000, auto_correct: true
  config.vm.network 'forwarded_port', guest: 3306, host: 33060, auto_correct: true
  config.vm.network 'forwarded_port', guest: 5432, host: 54320, auto_correct: true
  config.vm.network 'forwarded_port', guest: 35729, host: 35729, auto_correct: true

  config.vm.synced_folder './', '/vagrant', disabled: true

  # Run The Base Provisioning Script
  config.vm.provision 'shell', path: '../scripts/update.sh'
  config.vm.provision :reload
  config.vm.provision 'shell', path: '../scripts/provision.sh'
end
```
and many more places, explore!!

## Contributing
We'd love you to contribute to Brew Cooler. Fork the repo and do a pull request.

## Who Are You?
Homestead Builders's lead maintainer is [Charles Peterson](https://github.com/Artistan).

## License
Code is under the MIT.

