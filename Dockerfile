# The bullseye-slim variant of Debian is a minimal version of the Debian operating system that includes only the essential packages and tools
FROM debian:bullseye-slim  
# add a flag to avoid installing recommended pckg which are not required
 
RUN apt-get update && apt-get install --y --no-install-recommends \ 
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

# Copy the U-Boot source code into the container
COPY u-boot /app/u-boot

# Set the working directory
WORKDIR /app

# Build U-Boot
RUN make -C u-boot -j$(nproc) rpi_4_defconfig && \
    make -C u-boot -j$(nproc)

# Set the entrypoint for the container
ENTRYPOINT ["/bin/bash", "-c"]
