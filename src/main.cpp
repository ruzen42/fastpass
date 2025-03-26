#include <cstddef>
#include <cstdio>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string>

using namespace std;

string
gen_pass(long long length, bool h,bool d,bool s)
{
    srand (time(NULL));
	string chars, pass;

	if(h) chars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	if(d) chars += "0123456789";	

	if(s) chars += "()/*-+?!@#$^&*_=<>[]{}:;,.";

	for (long long i = 0; i < length; i++)
    {
        char ch = chars[rand() % chars.length()];
		pass.push_back(ch);
    }
    
    return pass;
}

int 
main(int argc, char* argv[])
{
    long long length = 8;
    bool digits = true;
    bool hight = true;
    bool signs = true;

    if (argc > 1)
    {
        length = (long long)argv[1];
        cout << length;
    }

    cout << gen_pass(length, hight, digits, signs) << "\n";
    return 0;
}
