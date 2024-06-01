#!/bin/zsh
# Get working directories

repodir=$1
scriptdir="${0:a:h}"

if [[ -z "${repodir}" ]]; then
    echo "Error: sm64ex repo directory must be provided as an argument."
    exit 1
fi

repodir=$(realpath "$repodir")

# Build game executable

cd "$repodir"

# Requests whether or not to add an icon if an icon is not found

if [ ! -e $scriptdir/icon.icns ]; then
    printf "\nYou have not added an icon, would you like to add one?\nEnter the path (or just drag and drop) the icon you want to add here. If not press enter again:\n > "
    read -r input
    if [ -e $input ] && [ ! $input = "" ]; then
        cp "$input" "$scriptdir/icon.icns"
        
    fi
fi

# Requests whether to apply the 60 FPS Patch

echo "
Attempting to add 60 FPS Patch! This is recommended for the best gameplay
ONLY APPLY THIS PATCH ONCE! If you patched the game once you don't have to patch it twice!

Press Enter to Continue"

# Waits for user input to continue

read -r input
$repodir/tools/apply_patch.sh $repodir/enhancements/60fps_ex.patch

# It is recommended that you add some more build parameters
# It is better to add these parameters for the best experience: BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 

gmake OSX_BUILD=1 -j4 

cd "$scriptdir"
# Cleanup
rm -rf ${0:a:h}/out

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

# Continutes with making the app bundle

xattr -cr out/sm64ex.app

# Bundle dylibs with app
dylibbundler -b -cd -x out/sm64ex.app/Contents/MacOS/sm64ex -d out/sm64ex.app/Contents/libs