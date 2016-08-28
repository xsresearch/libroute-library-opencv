set -e

# Switch user
su user

#Build
cd /home/user
cmake .
make
cp runopencv /usr/local/bin/

# Remove build files
rm -r -f /home/user/*
