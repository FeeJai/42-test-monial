DAYNUMBER=$1

cd d$DAYNUMBER
git pull
cd ..
./spawn.pl d$DAYNUMBER config_d$DAYNUMBER.pl
./tools/build.sh
./tools/verify.sh
./tools/check_all.sh
