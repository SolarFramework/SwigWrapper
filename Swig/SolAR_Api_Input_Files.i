%module solar_api_input_files
%{
#include "api/input/files/IMarker.h"
#include "api/input/files/IMarker2DNaturalImage.h"
#include "api/input/files/IMarker2DSquared.h"
#include "api/input/files/IMarker2DSquaredBinary.h"
#include "api/input/files/IPointCloudLoader.h"
#include "api/input/files/ITrackableLoader.h"
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

%shared_ptr(SolAR::api::input::files::IMarker)
%shared_ptr(SolAR::api::input::files::IMarker2DNaturalImage)
%shared_ptr(SolAR::api::input::files::IMarker2DSquared)
%shared_ptr(SolAR::api::input::files::IMarker2DSquaredBinary)
%shared_ptr(SolAR::api::input::files::IPointCloudLoader)
%shared_ptr(SolAR::api::input::files::ITrackableLoader)

///

%include "api/input/files/IMarker.h"

//#include "IMarker.h"
%include "api/input/files/IMarker2DSquared.h"

//#include "IMarker2DSquared.h"
%include "api/input/files/IMarker2DNaturalImage.h"

//#include "IMarker2DSquared.h"
%include "api/input/files/IMarker2DSquaredBinary.h"

%include "api/input/files/IPointCloudLoader.h"

%include "api/input/files/ITrackableLoader.h"
