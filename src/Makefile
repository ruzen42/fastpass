VER=1.1
ARCH=x86_64
BUILD=5
CPP=g++
KCFLAGS=-O9
TARGET=main.cpp

all:
	@echo "Build fastpass"
	@mkdir -p ../build
	@$(CPP) $(TARGET) $(KCFLAGS) -o fastpass

clean:
	@echo "Clean"
	@rm -r ../build/fastpass main dist

run: all
	@./fastpass

install: all
	@echo "Installing fastpass..."
	@install fastpass /usr/bin
	@echo "Successful install fastpass"

uninstall:
	@echo "Uninstalling fastpass..."
	@rm /usr/bin/fastpass
	@echo "Successful uninstall fastpass"

slackware: all
	@echo "Build Slackware package..."
	@mkdir -p dist/usr/bin dist/install 
	@cp ../build/fastpass dist/usr/bin/fastpass
	@cp slack-desc dist/install/slack-desc
	@cd dist && makepkg -l y -c y ../fastpass-$(VER)-$(ARCH)-$(BUILD).tgz
	@echo "Successful"
