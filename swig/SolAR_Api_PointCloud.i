%module solar_api_pointcloud
%{
#include "api/pointCloud/IPCFilter.h"
#include "api/pointCloud/IPCFilterCentroid.h"
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

%shared_ptr(SolAR::api::pointCloud::IPCFilter)
%shared_ptr(SolAR::api::pointCloud::IPCFilterCentroid)

///

%include "api/pointCloud/IPCFilter.h"

%include "api/pointCloud/IPCFilterCentroid.h"
