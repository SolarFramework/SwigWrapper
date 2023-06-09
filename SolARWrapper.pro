## remove Qt dependencies
QT       -= core gui
CONFIG -= qt

## global defintions : target lib name, version
INSTALLSUBDIR = SolARBuild
TARGET = SolARWrapper
FRAMEWORK = $$TARGET
VERSION=1.0.0

DEFINES += MYVERSION=$${VERSION}
DEFINES += TEMPLATE_LIBRARY
CONFIG += c++1z

include(findremakenrules.pri)

CONFIG(debug,debug|release) {
    DEFINES += _DEBUG=1
    DEFINES += DEBUG=1
}

CONFIG(release,debug|release) {
    DEFINES += _NDEBUG=1
    DEFINES += NDEBUG=1
}

DEPENDENCIESCONFIG = sharedlib recursive install

PROJECTCONFIG = QTVS

#NOTE : CONFIG as staticlib or sharedlib, DEPENDENCIESCONFIG as staticlib or sharedlib, QMAKE_TARGET.arch and PROJECTDEPLOYDIR MUST BE DEFINED BEFORE templatelibconfig.pri inclusion
include ($$shell_quote($$shell_path($${QMAKE_REMAKEN_RULES_ROOT}/templatelibconfig.pri)))  # Shell_quote & shell_path required for visual on windows

## DEFINES FOR MSVC/INTEL C++ compilers
msvc {
DEFINES += "_BCOM_SHARED=__declspec(dllexport)"
}

include (SolARWrapper.pri)

DEFINES += SWIG

unix {
    # Avoids adding install steps manually. To be commented to have a better control over them.
    QMAKE_POST_LINK += "make install"
}

unix:!android {
    QMAKE_CXXFLAGS += -Wignored-qualifiers
    QMAKE_LINK=clang++
    QMAKE_CXX = clang++
}

win32 {

    DEFINES += WIN64 UNICODE _UNICODE
    QMAKE_COMPILER_DEFINES += _WIN64
    QMAKE_CXXFLAGS += -wd4250 -wd4251 -wd4244 -wd4275 /Od
}

android {
    ANDROID_ABIS="arm64-v8a"
}

header_files.path = $${PROJECTDEPLOYDIR}/interfaces
header_files.files = $$files($${PWD}/interfaces/*.h*)

xpcf_xml_files.path = $$(HOME)/.xpcf/SolAR
xpcf_xml_files.files=$$files($${PWD}/xpcf*.xml)

INSTALLS += header_files
INSTALLS += xpcf_xml_files

OTHER_FILES += \
    packagedependencies.txt

#NOTE : Must be placed at the end of the .pro
include ($$shell_quote($$shell_path($${QMAKE_REMAKEN_RULES_ROOT}/remaken_install_target.pri)))) # Shell_quote & shell_path required for visual on windows
