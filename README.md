# fastpass
![GitHub Release](https://img.shields.io/github/v/release/ruzen42/fastpass?include_prereleases&sort=date&display_name=release&style=for-the-badge) 
![GitHub repo size](https://img.shields.io/github/repo-size/ruzen42/fastpass?style=for-the-badge)

**Fastpass** is a simple, fast, and minimalistic C++ command-line tool for generating secure random passwords and storing them locally.  
Built to be lightweight and easily compiled on any Linux system.

## Features
- Random password generation with configurable length and symbols  
- Simple local password storage (optional)  
- Extremely fast and small binary  
- No external dependencies, just standard C++  
- Slackware package build support out of the box  

## Usage

fastpass [length]

Example:
``` Bash
fastpass -l 123
#,V0?$O5DUG=U9+*>Y/&3{-=U6BTE9?.>F+)RH*(M/W5IG:W!!_8V*=_*I=J*_.=09D6J)@$:K={P$P]1C1#/P4MUTUGGT]5=],3++X*2QBL4[93SRD4#O_B6
```


## Build from source
Make sure you have `stack` installed.  
Then run:
``` Bash
git clone https://github.com/ruzen42/fastpass.git
cd fastpass/src
stack install
```
## Contributing
Contributions are welcome!  
- Fork the repository  
- Create a new branch (`git checkout -b feature-branch`)  
- Commit your changes (`git commit -am 'Add feature'`)  
- Push to your fork (`git push origin feature-branch`)  
- Create a Pull Request  

## License
Licensed under the BSD-3-Clause License.  
See the [LICENSE](LICENSE.txt) file for more details.  

## Disclaimer
Fastpass is provided "as is", without warranty of any kind.  
Use at your own risk.  
