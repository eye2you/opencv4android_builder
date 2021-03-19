## OpenCV4Android
Dockerfile to make the build process of the OpenCV Android modules easier.

The Dockerfile builds an image that downloads NDK v21e and the latest SDK. It accepts the license agreement, so by using this Dockerfile you also accept the Android SDK license agreement. It checks out OpenCV 4.5.1 with the contrib modules.

The 4 ABIs armeabi-v7a, arm64-v8a, x86, and x86_64 are built and then installed in /root/build/install before they are copied to /data/.

Mount a folder to /data/ in the container to copy the files out.