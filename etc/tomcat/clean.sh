dir=`date +%Y-%m-%d_%H-%M-%S`
mkdir -p ~/.Trash/$dir/
cd ../webapps
mv -f * ~/.Trash/$dir
cd ../work/Catalina/localhost
mkdir -p ~/.Trash/$dir/_work/
mv -f * ~/.Trash/$dir/_work
cd ../../../bin
