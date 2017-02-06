create: reset
	@wget http://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/MD5SUMS
	@MD5=`awk '/debian-testing/{print $(1)}' MD5SUMS` PACKER_LOG=1 packer build debian-testing-vagrant.json 2>>packer.log

reset:
	@rm -f packer.log debian-testing-vagrant.box MD5SUMS output-virtualbox-iso/

clean: reset
	@rm -rf packer_cache/
