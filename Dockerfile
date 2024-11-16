# Use Ubuntu as the base image
FROM ubuntu:22.04 AS base

# Set environment variables for the project
ENV project=meeting-sdk-linux-sample
ENV cwd=/tmp/$project

# Set working directory
WORKDIR $cwd

# Install build dependencies (CMake, OpenCV, and other libs)
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    cmake \
    curl \
    gdb \
    git \
    libopencv-dev \
    libdbus-1-3 \
    libssl-dev \
    libglib2.0-0 \
    pulseaudio pulseaudio-utils \
    && cmake --version  # Verifying cmake installation

# Install Tini for better process management (keep containers running in the background)
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Copy the essential project files into the container
COPY ./CMakeLists.txt /tmp/meeting-sdk-linux-sample/CMakeLists.txt
COPY ./CMakePresets.json /tmp/meeting-sdk-linux-sample/CMakePresets.json
COPY ./compose.yaml /tmp/meeting-sdk-linux-sample/compose.yaml
COPY ./vcpkg.json /tmp/meeting-sdk-linux-sample/vcpkg.json

# Copy the source code and SDK (lib and src)
COPY ./lib/zoomsdk /tmp/meeting-sdk-linux-sample/lib/zoomsdk
COPY ./src /tmp/meeting-sdk-linux-sample/src

# Copy the entry script
COPY ./bin/entry.sh /tmp/meeting-sdk-linux-sample/bin/entry.sh
RUN chmod +x /tmp/meeting-sdk-linux-sample/bin/entry.sh

# Configure and build the application using CMake
WORKDIR $cwd
RUN cmake -S . -B build && cmake --build build

# Define entry point to handle application startup
ENTRYPOINT ["/tini", "--", "./bin/entry.sh"]
