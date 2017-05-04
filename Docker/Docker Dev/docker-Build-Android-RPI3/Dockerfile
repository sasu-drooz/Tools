FROM ubuntu:15.04


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-8-jdk python-dev
RUN apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip bc gcc-arm-linux-gnueabihf python-mako
RUN mkdir ~/bin && PATH=~/bin:$PATH
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
RUN git config --global user.name "mydomohome" && git config --global user.email "mydomohome.eu@gmail.com"
RUN mkdir buildpath && cd buildpath/
RUN repo init -u https://android.googlesource.com/platform/manifest -b android-7.1.1_r6
RUN cd .repo && git clone https://github.com/peyo-hd/local_manifests -b nougat
RUN cd .. && repo sync
RUN cd kernel/rpi
RUN ARCH=arm scripts/kconfig/merge_config.sh arch/arm/configs/bcm2709_defconfig android/configs/android-base.cfg android/configs/android-recommended.cfg
RUN ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make zImage
RUN ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make dtbs
RUN cd ../..
RUN source build/envsetup.sh && lunch rpi3-eng && make



VOLUME ["/buildpath"]

