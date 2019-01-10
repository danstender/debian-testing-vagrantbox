MD5 := $(shell ./getmd5sum)
ROOTPW := $(shell pwgen 12 1)

create: reset
	MD5=$(MD5) ROOTPW=$(ROOTPW) PACKER_LOG=1 packer build debian-testing-vagrant.json 2>>packer.log

reset:
	@rm -f packer.log debian-testing-vagrant.box
	@rm -rf output-virtualbox-iso/ Vagrantfile

clean: reset
	@rm -rf packer_cache/
