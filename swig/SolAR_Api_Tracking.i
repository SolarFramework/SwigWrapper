%module solar_api_tracking
%{
#include "api/tracking/IOpticalFlowEstimator.h"
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

%shared_ptr(SolAR::api::tracking::IOpticalFlowEstimator)

%rename(UCharList) std::vector<unsigned char>;
%template(UCharList) std::vector<unsigned char>;
%rename(FloatList) std::vector<float>;
%template(FloatList) std::vector<float>;

///

%include "api/tracking/IOpticalFlowEstimator.h"
