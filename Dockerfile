FROM ubuntu:groovy
WORKDIR /root

RUN apt update && apt upgrade -y && apt install openjdk-11-jdk cmake ninja-build git wget unzip python3 -y
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip && \
    unzip commandlinetools-linux-6858069_latest.zip && \
    yes | cmdline-tools/bin/sdkmanager --sdk_root=/opt/android_sdk/ "platform-tools" "platforms;android-30" "build-tools;30.0.3" && \
    wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip && \
    unzip android-ndk-r21e-linux-x86_64.zip -d /opt/ && \
    git clone --branch 4.5.1 https://github.com/opencv/opencv && \
    git clone --branch 4.5.1 https://github.com/opencv/opencv_contrib
ENV ANDROID_NDK=/opt/android-ndk-r21e/ 
ENV ANDROID_SDK=/opt/android_sdk/
ENV ANDROID_HOME=/opt/android_sdk/
ENV ANDROID_NDK_HOME=/opt/android-ndk-r21e/
ENV ANDROID_PLATFORM=26

WORKDIR /root/build
COPY *.sh /root/build/

CMD ./build_all.sh




