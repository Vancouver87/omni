#/bin/sh

# some preparations
RKCRC="out/target/product/rk31board/rktools/rkcrc"
OUT=$PWD/out
TMP=/tmp

echo "*******************************"
echo "Create RockChips Images..."
echo "*******************************"

#
# create a new system.img
#
echo "** Creating system.img"
rm -f $OUT/system.img
dd if=/dev/zero of=$OUT/system.img bs=1024 count=610000 status=noxfer || exit 1
mke2fs -Fq -t ext3 -L SYSTEM $OUT/system.img
#
# mount fresh created system.img 
#
mkdir -p $TMP/system
sudo mount $OUT/system.img $TMP/system
sudo rm -r $TMP/system/*
#
# create content in  mounted system.img
#
sudo cp -r --preserve out/target/product/rk31board/system/* $TMP/system
sudo cp -r device/rockchip/common/gapps/* $TMP/system
sudo cp -r device/rockchip/common/SuperSU/* $TMP/system
# remove obsoletes
sudo rm -f $TMP/system/app/Browser.apk
#sudo rm $TMP/system/app/CMAccount.apk
#sudo mv $TMP/system/lib/hw/hwcomposer.rk30board.so $TMPp/system/lib/hw/hwcomposer.rk30board.so.org
# correct rights
sudo chown root:root -R $TMP/system
sudo chmod 06755 $TMP/system/xbin/su
sudo chmod 06755 $TMP/system/bin/.ext/.su
sudo chmod 00755 $TMP/system/xbin/daemonsu
sudo chmod 00755 $TMP/system/etc/install-recovery.sh
sudo chmod 00755 $TMP/system/bin/sysinit
#sudo chmod 00644 $TMP/system/build.prop

#
# unmount system.img 
#
sudo umount $TMP/system
rm -r $TMP/system

#
# create boot.img
#
echo "** Creating boot.img"

rm -f $OUT/boot.img
pushd out/target/product/rk31board/root/
echo "** Modify default.prop"
sed -i "s/ro.adb.secure=1/ro.adb.secure=0/g" default.prop
sed -i "s/ro.secure=1/ro.secure=0/g" default.prop
sed -i "s/ro.allow.mock.location=0/ro.allow.mock.location=1/g" default.prop
chmod g-w -R *
find . | cpio -o -H newc | gzip -n > $OUT/boot.gz
popd

$RKCRC -k $OUT/boot.gz $OUT/boot.img
rm $OUT/boot.gz

echo "** DONE ***********************"
exit 0
