# DEPRECATED - This repo is no longer maintained
----
# SolARWrapper

[![License](https://img.shields.io/github/license/SolARFramework/SwigWrapper?style=flat-square&label=License)](https://www.apache.org/licenses/LICENSE-2.0)

The **SolAR Wrapper** is made of several [SWIG](http://www.swig.org/) interfaces which allow us to use the whole SolAR API in languages other than C++, such as C# for Unity environment. But we can imagine other languages like Java, Python...

The Simplified Wrapper and Interface Generator (SWIG) is an open-source software tool used to connect computer programs or libraries written in C or C++ with scripting languages such as Lua, Perl, PHP, Python, R, Ruby, Tcl, and other languages like C#, Java, JavaScript, Go, D, OCaml, Octave, Scilab and Scheme. Output can also be in the form of XML.

The export of SolAR pipelines to Unity is described on the website section, [Assemble/Export your pipeline for Unity](http://www.solarframework.org/assemble/unity_pipeline/#export_your_pipeline_for_unity).

## How to build

* Download [Swig](http://www.swig.org/) (use for wrapping), unzip the archive, and add an environment variable to `Path` for the `swig.exe`. 

* Run `./_build.bat` will generate a set of csharp files in `$REMAKEN_PKG_ROOT/packages/SolARBuild/win-cl-14.1/SolARWrapper/0.8.0/csharp/` from c++ which includes XPCF and SolARFramework interfaces.

* It will also call `BuildCSharp.bat` script from [SolARPipelineManager](https://github.com/SolarFramework/SolARPipelineManager).

* Then open `SolARWrapper.pro` and build it.

## How to update SWIG files

### Version
If there is a new version of SolARFramework you should update version of the framework for :
* `packagedependencies.txt`
* `SolARWrapper.pro`
* `_build.bat`
* `SolARPipelineManager/_BuildCSharp.bat`

### Interface/namespace
If there is new interfaces in SolARFramework you should add them to the wrapper. You will need to edit SWIG rules.

#### New namespace

* Add every namespace `./Swig/SolAR_<namespace>.i`
* Edit `SolARWrapper.pri` to add new namespace in `SOURCES=`
* Edit `./Swig/SolAR.i` :  `%import` and `using`

#### New interface

In the dedicated `*.i` :
* Add `#include`
* Add `%include`
* Add `%shared_ptr` if required
* Add `#include` and `BIND_TO_INTERFACE` in `./Swig/SolAR.i`

## Contact 
Website https://solarframework.github.io/

Contact framework.solar@b-com.com



