# packer-ubuntu-jenkins-master

This repository builds a machine image using
[Packer](https://www.packer.io/)
to build an 
Ubuntu 14.0.5 ISO image
for a Jenkins server.

## Build dependencies

See [build dependencies](https://github.com/docktermj/KnowledgeBase/blob/master/build-dependencies/packer.md).

## Build

Use `make help` to see targets.

### Build all versions

```console
make
```

### Build specific version

VMware

```console
make vmware-iso
```

VirtualBox

```console
make virtualbox-iso
```
```

## Run on VMware Workstation

1. Choose VMX file
   1. VMware Workstation > File > Open...
      1. Navigate to `.../packer-ubuntu-14.04/output-vmware-iso-nnnnnnnnnn/`
      1. Choose `packer-ubuntu-14.04-nnnnnnnnnn.vmx`
1. Optional: Change networking
   1. Navigate to VMware Workstation > My Computer > packer-centos7-devenv-nnnnnnnnnn
   1. Right click on "packer-centos7-devenv-nnnnnnnnnn" and choose "Settings"
   1. Hardware tab > Network Adapter > Network Connection :radio_button: Bridged: Connected directly to the physical network
   1. Click "Save"
1. Optional: Change memory
   1. Navigate to VMware Workstation > My Computer > packer-centos7-devenv-nnnnnnnnnn
   1. Right click on "packer-centos7-devenv-nnnnnnnnnn" and choose "Settings"
   1. Hardware tab > Memory > 2 GB (2048 MB)
   1. Click "Save"
1. Optional: Change processors
   1. Navigate to VMware Workstation > My Computer > packer-centos7-devenv-nnnnnnnnnn
   1. Right click on "packer-centos7-devenv-nnnnnnnnnn" and choose "Settings"
   1. Hardware tab > Processors
      1. Number of processors: 2
      1. Number of cores per processor: 2
   1. Click "Save"  
1. Run image
   1. Choose VMware Workstation > My Computer > packer-ubuntu-14.04-nnnnnnnnnn
   1. Click "Start up this guest operating system"
1. Username: vagrant  Password: vagrant

## Run on Vagrant / VirtualBox

### Add to library

```console
vagrant box add --name="packer-ubuntu-14.04-virtualbox" ./packer-ubuntu-14.04-virtualbox-nnnnnnnnnn.box
```

### Run

An example of how to run in a new directory.

#### Specify directory

In this example the `/tmp/packer-ubuntu-14.04` directory is used.

```console
export PACKER_UBUNTU_1404=/tmp/packer-ubuntu-14.04
```

#### Initialize directory

Back up an old directory and initialize new directory with Vagrant image.

```console
mv ${PACKER_UBUNTU_1404} ${PACKER_UBUNTU_1404}.$(date +%s)
mkdir ${PACKER_UBUNTU_1404}
cd ${PACKER_UBUNTU_1404}
vagrant init packer-ubuntu-14.04-virtualbox
```

#### Enable remote login

Modify Vagrantfile to allow remote login by
uncommenting `config.vm.network` in `${PACKER_UBUNTU_1404}/Vagrantfile`. 
Example:

```console
sed -i.$(date +'%s') \
  -e 's/# config.vm.network \"public_network\"/config.vm.network \"public_network\"/g' \
  ${PACKER_UBUNTU_1404}/Vagrantfile
```

#### Start guest machine

```console
cd ${PACKER_UBUNTU_1404}
vagrant up
```

### Login to guest machine

```console
cd ${PACKER_UBUNTU_1404}
vagrant ssh
```

### Find guest machine IP address

In the vagrant machine, find the IP address.

```console
ip addr show
```

### Remote login to guest machine

SSH login from a remote machine.

```console
ssh vagrant@nn.nn.nn.nn
```

Password: vagrant


### Remove image from Vagrant library

To remove Vagrant image, on host machine:

```console
vagrant box remove packer-ubuntu-14.04-virtualbox
```

## References
1. [Build dependencies](https://github.com/docktermj/KnowledgeBase/blob/master/build-dependencies/packer.md).
1. [Bibliography](https://github.com/docktermj/KnowledgeBase/blob/master/bibliography/packer.md)
