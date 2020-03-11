## remove Qt dependencies
QT       -= core gui
CONFIG -= qt

## global defintions : target lib name, version
INSTALLSUBDIR = SolARBuild
TARGET = SolARWrapper
FRAMEWORK = $$TARGET
VERSION=0.7.0

DEFINES += MYVERSION=$${VERSION}
DEFINES += TEMPLATE_LIBRARY
CONFIG += c++1z


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
include ($$shell_quote($$shell_path($$(REMAKEN_RULES_ROOT)/qmake/templatelibconfig.pri)))  # Shell_quote & shell_path required for visual on windows

## DEFINES FOR MSVC/INTEL C++ compilers
msvc {
DEFINES += "_BCOM_SHARED=__declspec(dllexport)"
}


HEADERS += \

SOURCES += \
	SolAR_Api_Display_wrap.cxx \
	SolAR_Api_Features_wrap.cxx \
	SolAR_Api_Fusion_wrap.cxx \
	SolAR_Api_Geom_wrap.cxx \
	SolAR_Api_Image_wrap.cxx \
	SolAR_Api_Input_Devices_wrap.cxx \
	SolAR_Api_Input_Files_wrap.cxx \
	SolAR_Api_Pipeline_wrap.cxx \
	SolAR_Api_Reloc_wrap.cxx \
	SolAR_Api_Sink_wrap.cxx \
	SolAR_Api_Solver_Map_wrap.cxx \
	SolAR_Api_Solver_Pose_wrap.cxx \
	SolAR_Api_Source_wrap.cxx \
	SolAR_Api_Tracking_wrap.cxx \
	SolAR_Core_wrap.cxx \
	SolAR_Datastructure_wrap.cxx \
	SolAR_wrap.cxx \
	XPCF_Api_wrap.cxx \
	XPCF_Collection_wrap.cxx \
	XPCF_Component_wrap.cxx \
	XPCF_Core_wrap.cxx \
	XPCF_Module_wrap.cxx \
	XPCF_Properties_wrap.cxx \
	XPCF_Traits_wrap.cxx \

DEFINES += SWIG

unix:!android {
    QMAKE_CXXFLAGS += -Wignored-qualifiers
    QMAKE_LINK=clang++
    QMAKE_CXX = clang++
}

macx {
    DEFINES += _MACOS_TARGET_
    QMAKE_MAC_SDK= macosx
    QMAKE_CFLAGS += -mmacosx-version-min=10.7 -std=c11 #-x objective-c++
    QMAKE_CXXFLAGS += -mmacosx-version-min=10.7 -std=c11 -std=c++11 -O3 -fPIC#-x objective-c++
    QMAKE_LFLAGS += -mmacosx-version-min=10.7 -v -lstdc++
    LIBS += -lstdc++ -lc -lpthread
}

win32 {

    DEFINES += WIN64 UNICODE _UNICODE
    QMAKE_COMPILER_DEFINES += _WIN64
    QMAKE_CXXFLAGS += -wd4250 -wd4251 -wd4244 -wd4275 /Od
}

android {
    QMAKE_LFLAGS += -nostdlib++
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
include ($$shell_quote($$shell_path($$(REMAKEN_RULES_ROOT)/qmake/remaken_install_target.pri)))) # Shell_quote & shell_path required for visual on windows
