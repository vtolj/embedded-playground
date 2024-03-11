# The bullseye-slim variant of Debian is a minimal version of the Debian operating system that includes only the essential packages and tools
FROM debian:bullseye-slim  
# add a flag to avoid installing recommended pckg which are not required
 
RUN apt-get update && apt-get install --yes --no-install-recommends \ 
  make \
  crossbuild-essential-arm64 \
  bison \
  flex \
  device-tree-compiler \
  pkg-config \
  ncurses-dev \
  libssl-dev \
  git \
  gcc \
  g++ \
  libncurses-dev \
  python3-ply \
  python3-git \
  libgmp3-dev \
  libmpc-dev \
  gcc-aarch64-linux-gnu \
  u-boot-tools \
  gcc-arm-linux-gnueabi \
  bc \ 
  gcc-arm* \
  golang \
  tftpd-hpa \
  qemu-utils \
  fdisk \
  kpartx \
  qemu-user-static \
  binfmt-support \
  parted \
  libncurses5-dev \
  pkg-config \
  python \
  acpica-tools \
  wget \
  cpio \
  gettext \
  \
  dosfstools \
  e2fsprogs \
  exfat-utils \
  symlinks \
  kmod 

# Disable SSL certificate verification for git
RUN git config --global http.sslVerify false

# Clone the U-Boot source code repository
RUN git clone --depth 1 https://source.denx.de/u-boot/u-boot.git

# Set the ownership and permissions of the /u-boot directory
RUN chown -R $USER:$USER /u-boot && \
    chmod -R u+rwX /u-boot
# Set the working directory
WORKDIR /u-boot

# Build U-Boot
# RUN make -j$(nproc) rpi_4_defconfig && \
#     make -j$(nproc)

# Set the entrypoint for the container
ENTRYPOINT ["/bin/bash", "-c"]
