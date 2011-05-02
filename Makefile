default: all

all:
	linux32 sudo ./buildscript.sh all

lite:
	linux32 sudo ./buildscript.sh lglive-lite-iso

big:
	linux32 sudo ./buildscript.sh lglive-big-iso

clean:
	sudo ./buildscript.sh clean

vmgo:
	qemu -cdrom out/lglive-0.9.7-i686-hybrid-lite.iso -drive ifde,cache=unsafe,aio=native,file=vmhdd.img -soundhw ac97 -m 1024M -boot order=dc

vmdisk:
	qemu-img create -f qcow2 vmhdd.img 10G
