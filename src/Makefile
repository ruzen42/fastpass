all:
	mkdir -p ../build
	g++ -O2 main.cpp -o ../build/fastpass

clean:
	rm ../build/fastpass
	rm main

run:
	g++ main.cpp -o main
	./main

install:
	cp ../build/fastpass /usr/bin

uninstall:
	rm /usr/bin/fastpass
	
