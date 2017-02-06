This is a JSON template, a preseeding configuration for the Debian Installer (d-i), and helper scripts to automatically build Vagrant boxes [1] from Debian "testing" daily snapshots [2] with HashiCorp's Packer [3].

To use this, a Packer binary [4] and Virtualbox [5] must be available.
There's a Makefile included which conveniently provides the MD5 hash of the Debian netinst ISO for the Packer template.
If you have GNU Make, awk and wget available you could just do:
```
$ make create
```

Otherwise, you could run the template with:
```
MD5=<hash> packer build debian-testing-vagrant.json
```
where `<hash>` must be copied from <http://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/MD5SUMS> (it's the hash for `debian-testing-amd64-netinst.iso`).

A fast internet connection is needed for good performance.
If the time needed to install the Debian base system within the virtual machine exceeds the preset timeout for Packer to wait for SSH to become available for that (25 minutes), you could expand `ssh_wait_timeout` in the template as it's needed.

When the box is created it could be used with Vagrant.
First, the new box has to be added:
```
$ vagrant box add mydebian debian-testing-vagrant.box
```

Then, `vagrant init mydebian` could be performed in a random working directory.

Have fun!

Links
=====

[1] https://www.vagrantup.com/

[2] http://cdimage.debian.org/cdimage/daily-builds/

[3] https://www.packer.io/

[4] https://www.packer.io/downloads.html

[5] https://www.virtualbox.org/
