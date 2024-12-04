#include <cstddef>
#include <cstdio>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string>

using namespace std;

string GenPass(
	bool settings[], 
	long long lenght
			  )
{
    srand (time(NULL));
	string chars, pass
	;
    if (settings[0]) chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    else chars = "abcdefghijklmnopqrstuvwxyz";
    if (settings[1]) chars += "0123456789";
    else chars = "abcdefghijklmnopqrstuvwxyz";
    if (settings[2]) chars += "()/*-+?№!@#$%^&*_=<>[]{}:;,.";
    else chars = "abcdefghijklmnopqrstuvwxyz";

    if (settings[0]) chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    if (settings[1]) chars += "0123456789";

    if (settings[2]) chars += "()/*-+?№!@#$%^&*_=<>[]{}:;,.";

	for (long long i {0}; i < lenght; i++) pass = pass + chars[rand() % chars.size() + 1]; srand (time(NULL));
    return pass;
}

int main(int argc, char* argv[])
{
        long long length {8};
        bool settings[3] = {true, true, true};

        /* settings[0] is high register characters
         * settings[1] is digits
         * settings[2] is signs
         */ 

        /*cin >> lenght;
        *cin.ignore();
        */

        if (argc > 1)
        {
            length = atoi(argv[1]);
        }

        cout << GenPass(settings, length) << endl;

        return 0;
}

