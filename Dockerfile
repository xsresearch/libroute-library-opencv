FROM ruby:2.3.1

# Add user
RUN useradd -m -u 1000 user

# Build library
COPY build.sh /home/user/build.sh
RUN /home/user/build.sh

# Build interface
COPY build_interface.sh /home/user/build_interface.sh
COPY CMakeLists.txt /home/user/CMakeLists.txt
COPY runopencv.cpp /home/user/runopencv.cpp
RUN chown user:user /home/user/CMakeLists.txt /home/user/runopencv.cpp
RUN /home/user/build_interface.sh

# Copy libroute component files
COPY entrypoint.rb /home/user/entrypoint.rb 
COPY handler.rb /home/user/handler.rb 
RUN chown user:user /home/user/entrypoint.rb /home/user/handler.rb

# Configure
USER user
ENTRYPOINT /home/user/entrypoint.rb

