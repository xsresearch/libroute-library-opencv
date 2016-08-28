set -e

# Add build tools
apt-get update
apt-get install -y cmake g++ unzip sudo

# Install component tools
gem install libroute-component

# Enable sudo
echo "user    ALL=(root) NOPASSWD: ALL" >> /etc/sudoers

# Switch user
su user

# Build
cd /home/user
wget https://github.com/Itseez/opencv/archive/3.0.0.zip
echo "7b7cd6cb3b7bad537cacad04bb7aa264a897d545  3.0.0.zip" | sha1sum -c
unzip 3.0.0.zip
cd opencv-3.0.0
cmake .
make
sudo make install

# Remove build files
rm -r -f /home/user/3.0.0.zip
rm -r -f /home/user/opencv-3.0.0
