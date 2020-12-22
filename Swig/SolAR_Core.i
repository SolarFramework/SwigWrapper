%module solar_core
%{
#include "core/Log.h"
#include "core/Messages.h"
#include "core/SerializationDefinitions.h"
#include "core/SolARFramework.h"
#include "core/SolARFrameworkDefinitions.h"
%}

%include "Swig.i"

%typemap(csimports) SWIGTYPE
%{
%}

///

%rename(CharList) std::vector<char const *>;
%template(CharList) std::vector<char const *>;

///

%include "core/Messages.h"

%ignore SolAR::getSolARFrameworkVersion(); //TODO Missing implementation
%include "core/SolARFramework.h"

%include "core/SolARFrameworkDefinitions.h"

//#include "SolARFrameworkDefinitions.h"
%ignore SolAR::Log::logger(); // spdlog::logger
%include "core/Log.h"

//#include <core/SolARFrameworkDefinitions.h>
%include "core/SerializationDefinitions.h"
#undef DECLARESERIALIZE
#define DECLARESERIALIZE(T) //
