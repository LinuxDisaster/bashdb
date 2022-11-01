#Create deb source files in bash-0.1 folder. bashdb_0.1.orig.tar.xz is creating upper bashdb-0.1 folder.
#dh_make --indep --createorig
#Build deb package from deb source file
echo "---------Building deb package from source files---------"
cd ./bashdb-0.1
dpkg-buildpackage -rsudo
cd ../
echo "---------Installing builded deb package---------"
sudo apt install ./bashdb_0.1-1_all.deb
