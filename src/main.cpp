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

string GenPass(long long length,bool h,bool d,bool s)
{
    srand (time(NULL));
	string chars, pass;

	if(h)
		chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	if(d)
		chars += "0123456789";	

	if(s)
		chars += "()/*-+?!@#$^&*_=<>[]{}:;,.";

	for (short i = 0; i < length; i++)
    {
        char ch = chars[rand() % chars.length()];
		pass.push_back(ch);
    }
    
    return pass;
}

int main(int argc, char* argv[])
{
        long long length = 8;

        bool digits = true;
        bool hight = true;
        bool signs = true;

        /* settings[0] is high register characters
         * settings[1] is digits
         * settings[2] is signs
         */ 

        cout << GenPass(length,hight,digits,signs) << "\n";

		#ifdef _WIN32
			system("pause");
		#endif

        return 0;
}
