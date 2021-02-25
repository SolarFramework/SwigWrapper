%module xpcf_traits
%{
#include "xpcf/api/InterfaceTraits.h"
#include "xpcf/component/ComponentTraits.h"
#include "xpcf/core/traits.h"
%}

%include "Swig.i"

%import (module="XPCF.Core") "XPCF_Core.i"

%typemap(csimports) SWIGTYPE
%{
	using XPCF.Core;
%}

///

%include "xpcf/api/InterfaceTraits.h"

%include "xpcf/component/ComponentTraits.h"

//#include "xpcf/api/InterfaceTraits.h"
//#include "xpcf/component/ComponentTraits.h"
%include "xpcf/core/traits.h"
