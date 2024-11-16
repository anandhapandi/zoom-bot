Package: cli11:x64-linux@2.4.2#1

**Host Environment**

- Host: x64-linux
- Compiler: GNU 13.2.0
-    vcpkg-tool version: 2024-11-12-eb492805e92a2c14a230f5c3deb3e89f6771c321
    vcpkg-scripts version: 9b5cb8e55 2024-11-14 (33 hours ago)

**To Reproduce**

`vcpkg install `

**Failure logs**

```
Downloading CLIUtils-CLI11-v2.4.2.tar.gz
Successfully downloaded CLIUtils-CLI11-v2.4.2.tar.gz.
-- Extracting source /home/anand/vcpkg/downloads/CLIUtils-CLI11-v2.4.2.tar.gz
-- Applying patch revert-1012-pkgconfig.diff
-- Using source at /home/anand/vcpkg/buildtrees/cli11/src/v2.4.2-64dc5db4f1.clean
-- Configuring x64-linux
-- Building x64-linux-dbg
-- Building x64-linux-rel
-- Fixing pkgconfig file: /home/anand/vcpkg/packages/cli11_x64-linux/lib/pkgconfig/CLI11.pc
CMake Error at scripts/cmake/vcpkg_find_acquire_program.cmake:166 (message):
  Could not find pkg-config.  Please install it via your package manager:

      sudo apt-get install pkg-config
Call Stack (most recent call first):
  scripts/cmake/vcpkg_fixup_pkgconfig.cmake:193 (vcpkg_find_acquire_program)
  ports/cli11/portfile.cmake:24 (vcpkg_fixup_pkgconfig)
  scripts/ports.cmake:192 (include)



```

**Additional context**

<details><summary>vcpkg.json</summary>

```
{
  "name": "meeting-sdk-linux-sample",
  "version": "1",
  "dependencies": [
    "ada-url",
    "cli11",
    "jwt-cpp"
  ]
}

```
</details>
