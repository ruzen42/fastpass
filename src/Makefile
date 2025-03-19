VER=1.1
ARCH=x86_64
BUILD=1

all:
	mkdir -p ../build
	g++ -Ofast main.cpp -o ../build/fastpass

clean:
	rm ../build/fastpass
	rm main
	rm -rf dist

run:
	g++ main.cpp -o main
	./main

install:
	cp ../build/fastpass /usr/bin

uninstall:
	rm /usr/bin/fastpass

slackware: all
	mkdir -p dist/usr/bin dist/install 
	cp ../build/fastpass dist/usr/bin/fastpass
	cp slack-desc dist/install/slack-desc
	cd dist && makepkg -l y -c y ../fastpass-$(VER)-$(ARCH)-$(BUILD).tgz
