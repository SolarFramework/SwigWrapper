%module xpcf_component
%{
#include "xpcf/component/ComponentBase.h"
//#include "xpcf/component/ComponentFactory.h" // Moved to XPCF_Api
//#include "xpcf/component/ComponentTraits.h" // Moved to XPCF_Traits
#include "xpcf/component/ConfigurableBase.h"
%}

%include "Swig.i"

//%import (module="XPCF.Core") "XPCF_Core.i"
%import (module="XPCF.Api") "XPCF_Api.i"

%typemap(csimports) SWIGTYPE
%{
	using XPCF.Core;
	using XPCF.Api;
%}

///

%shared_ptr(org::bcom::xpcf::ComponentBase)

///

//#include "xpcf/component/ComponentFactory.h"
%include "xpcf/component/ComponentBase.h"

//#include "xpcf/component/ComponentBase.h"
//%include "xpcf/component/ConfigurableBase.h" //TODO Error
