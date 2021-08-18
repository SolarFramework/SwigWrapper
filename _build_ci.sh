@echo off
clear
CURRENTDIR=$PWD
SOLAR_PIPELINE_MANAGER_PATH=$1
echo Apply BuildCSharp shell file in SolARPipelineManager folder

cd $SOLAR_PIPELINE_MANAGER_PATH
./BuildCSharp.sh
cd $CURRENTDIR

#setlocal ENABLEDELAYEDEXPANSION  ????

pushd ${0%/*} #%~dp0

LANG=csharp
COMPILER=linux-gcc
SOLAR_WRAPPER_VERSION=0.9.1
SOLAR_VERSION=0.9.1
XPCF_VERSION=2.5.0
OUT=$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARWrapper/$SOLAR_WRAPPER_VERSION/$LANG
echo OUT: $OUT 



for swigfile in Swig/*.i 
do
    echo -------------------
    echo - $swigfile
    SWIG_FILE_NAME=`basename -s .i $swigfile`
    DIR=${SWIG_FILE_NAME//_/\/}
    OUTPUT="$OUT/$DIR"
    [ -d "$OUTPUT" ] && rm "$OUTPUT"/*.* || mkdir -p "$OUTPUT"
    echo swig -c++ -$LANG -small -O -outcurrentdir -I./Swig -I./Swig/include -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERSION/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -dllimport SolARWrapper -namespace ${SWIG_FILE_NAME//_/.} -outdir $OUTPUT $swigfile
	swig -c++ -$LANG -small -O -outcurrentdir -I./Swig -I./Swig/include -I$HOME/.remaken/packages/$COMPILER/xpcf/$XPCF_VERSION/interfaces -I$HOME/.remaken/packages/SolARBuild/$COMPILER/SolARFramework/$SOLAR_VERSION/interfaces -DXPCF_USE_BOOST -dllimport SolARWrapper -namespace ${SWIG_FILE_NAME//_/.} -outdir $OUTPUT $swigfile
done

popd

echo ----------------------- completed ----------------------------

files=`find $OUT -name "*PINVOKE.cs"`
#MonoPInvokeCallback should be added to static method generated by SWIG while using IL2CPP
echo "########## Edit for Android support"
for file in $files
do
    echo "#" $file
    sed -i -e 's/static void SetPending/[AOT.MonoPInvokeCallback(typeof(ExceptionDelegate))]\n\t\tstatic void SetPending/g' $file
    sed -i -e 's/static string CreateString(string cString)/[AOT.MonoPInvokeCallback(typeof(SWIGStringDelegate))]\n\t\tstatic string CreateString(string cString)/g' $file
done	