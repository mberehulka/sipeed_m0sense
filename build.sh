APP=$1
rm .bin/$APP.uf2

cd M0sense_BL702_example
PATH=$PATH:$(pwd)/toolchain_gcc_sifive_linux/bin

# Compiling
cd bl_mcu_sdk
make APP=$APP APP_DIR=../../src BOARD=bl702_iot  SUPPORT_FLOAT=y SUPPORT_USBSTDIO_ENABLE=y
cd ..

# Converting to UF2
mkdir ../.bin/
misc/utils/uf2_convert bl_mcu_sdk/out/src/$APP/${APP}_bl702.bin ../.bin/${APP}.uf2
cd ..

# Waiting for device plug in
while true; do
    DMNTP=$(lsblk -o name,label | grep -E "M0SENSE" | grep -Eo '^[^ ]+')
    if [ "$DMNTP" != "" ]; then
        break
    fi
    echo device not found, trying again...
    sleep 1
done

# Uploading
echo m0sense device found at $DMNTP
sudo mkdir -p /mnt/m0sense
sudo mount /dev/$DMNTP /mnt/m0sense/
sudo rsync --progress  .bin/${APP}.uf2 /mnt/m0sense

./serial.sh