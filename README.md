# Note!

This is tool is not made by the developers of sm64ex. Just a tool made to make the process of compiling it quicker and a little more accessible for those who have never used terminal, or compiled anything before.

# About SM64EX-mac Build Tool

A script to compile sm64ex (and easily install everything you need to compile it) for macOS (Intel or Apple silicon) and create an app bundle (turn it into an app that you can open). There are more feature to come such as the ability to say what build flags other build flags you want on, without having to change it in the shell script. Also a UI wrapper might also be made!

## Dependencies

Compiling sm64ex and creating an app bundle with all dylibs included on macOS requires the following Homebrew bottles to be installed, however if you run the sm64ex-mac build tool everything you need will be automatically be installed:

```sh
brew install gcc make sdl2 glew glfw pkg-config dylibbundler
```

## Building

Download (clone) the sm64ex repository (or you can have the script download it):

```sh
git clone https://github.com/sm64pc/sm64ex.git
```

Place a legally obtained US Super Mario 64 ROM in the sm64ex repository root and name it `baserom.us.z64`. Then apply any patches you want to apply, before compilation. By default the sm64ex-mac build tool will prompt you to apply 60 FPS patch script.

Clone this repository:

```sh
git clone https://github.com/haframjolk/sm64ex-mac.git
```

Place the icon you want to use for the app bundle in the repository root and name it `icon.icns` or when the sm64ex-mac Build Tool asks you if you want to add an icon, drag and drop it.

After you have the sm64ex repository set up just run the build script:

```sh
./install_build_everything.sh
```
In the releases, there is a version (the same thing without the .sh in the name) which you can open from Finder! That might be easier.
The freshly made app will then be appear in a new folder called `out` in the same folder which the sm64ex-mac Build Tool.

## Credits

This is a fork of Haframjolk's tool

- SpyterDev: Developer behind this fork. Created dependency installer, build prompts (option to also add an icon in script, and option to apply the 60 FPS Patch before compiliation).
- Haframjolk: The original developer behind the script (https://github.com/haframjolk/sm64ex-mac). Created the app bundling implementation which the fork uses!
