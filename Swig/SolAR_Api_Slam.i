%module solar_api_slam
%{
#include "api/slam/IBootstrapper.h"
#include "api/slam/IMapping.h"
#include "api/slam/ITracking.h"
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

%shared_ptr(SolAR::api::slam::IBootstrapper)
%shared_ptr(SolAR::api::slam::IMapping)
%shared_ptr(SolAR::api::slam::ITracking)

///

%include "api/slam/IBootstrapper.h"

%include "api/slam/IMapping.h"

%include "api/slam/ITracking.h"
