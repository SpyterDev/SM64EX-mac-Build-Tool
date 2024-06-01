#!/bin/zsh
# Get working directories

scriptdir="${0:a:h}"
repodir=$1

if [[ -z "${repodir}" ]]; then
    echo "Error: sm64ex repo directory must be provided as an argument."
    exit 1
fi

repodir=$(realpath "$repodir")

# Build game executable
cd "$repodir"

# It is recommended that you add some more build parameters
# It is better to add these parameters for the best experience: BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 

gmake OSX_BUILD=1 -j4 

# Cleanup
cd "$scriptdir"
rm -rf out

# Create app bundle
mkdir -p out/sm64ex.app/Contents/MacOS out/sm64ex.app/Contents/Resources
cp icon.icns out/sm64ex.app/Contents/Resources
cp Info.plist out/sm64ex.app/Contents

# Fixing pixelated window decoration bug
# This is fixed by creating a script to run the game from a subfolder
# Not sure how this bug came to be or why this fixes it but it works

mkdir -p out/sm64ex.app/Contents/MacOS out/sm64ex.app/Contents/MacOS/sm64ex_game/
cp "$repodir/build/us_pc/sm64.us.f3dex2e" out/sm64ex.app/Contents/MacOS/sm64ex_game/sm64ex
touch out/sm64ex.app/Contents/MacOS/sm64ex 
echo "#!/bin/zsh
\${0:a:h}/sm64ex_game/sm64ex" >> out/sm64ex.app/Contents/MacOS/sm64ex
chmod 755 out/sm64ex.app/Contents/MacOS/sm64ex 

#Continutes with making the app bundle

xattr -cr out/sm64ex.app

# Bundle dylibs with app
dylibbundler -b -cd -x out/sm64ex.app/Contents/MacOS/sm64ex -d out/sm64ex.app/Contents/libs
