%module solar_api_reloc
%{
#include "api/reloc/IKeyframeRetriever.h"
#include "api/reloc/IRegression.h"
#include "api/reloc/IRelocalizer.h"
%}

%include "Swig.i"

%import (module="XPCF.Api") "XPCF_Api.i"
%import (module="SolAR.Core") "SolAR_Core.i"
%import (module="SolAR.Datastructure") "SolAR_Datastructure.i"

%typemap(csimports) SWIGTYPE
%{
    using XPCF.Api;
    using SolAR.Core;
    using SolAR.Datastructure;
%}

///

%shared_ptr(SolAR::api::reloc::IKeyframeRetriever)

%shared_ptr(SolAR::api::reloc::IRelocalizer)
%shared_ptr(SolAR::api::reloc::IRegression)

///
// TODO: manage std::unique_lock
%ignore SolAR::api::reloc::IKeyframeRetriever::getKeyframeRetrieval;
%include "api/reloc/IKeyframeRetriever.h"
%include "api/reloc/IRegression.h"
%include "api/reloc/IRelocalizer.h"
