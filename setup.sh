git clone --recursive https://github.com/Sipeed/M0sense_BL702_example.git
cd M0sense_BL702_example
git clone https://github.com/wonderfullook/toolchain_gcc_sifive_linux
./build.sh patch
P=$(pwd)
PATH=$PATH:$P/toolchain_gcc_sifive_linux/bin
# sudo apt install gcc
gcc -I libs/uf2_format misc/utils/uf2_conv.c -o uf2_convert