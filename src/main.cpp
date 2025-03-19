#include <cstddef>
#include <cstdio>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string>

using namespace std;

#define HIGH 1
#define DIGITS 1
#define SIGNS 1

string 
GenPass(long long length)
{
    srand (time(NULL));
	string chars, pass;

	#if HIGH
		chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    #endif

	#if DIGITS
		chars += "0123456789";	
    #endif

	#if SIGNS
		chars += "()/*-+?!@#$^&*_=<>[]{}:;,.";
	#endif

	for (long long i {0}; i < length; i++) 
		pass = pass + chars[rand() % chars.size() + 1]; srand (time(NULL));

    return pass;
}

int
main(int argc, char* argv[])
{
        long long length = 8;

        /* settings[0] is high register characters
         * settings[1] is digits
         * settings[2] is signs
         */ 

        if (argc > 1)
            length = atoi(argv[1]);

        cout << GenPass(length) << "\n";

        return 0;
}

