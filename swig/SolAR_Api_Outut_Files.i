%module solar_api_input_files
%{
#include "api/output/files/IMeshExporter.h"
#include "api/output/files/IPointCloudExporter.h"
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
%shared_ptr(SolAR::api::output::files::IMeshExporter)
%shared_ptr(SolAR::api::output::files::IPointCloudExporter)

///

%include "api/output/files/IMeshExporter.h"
%include "api/output/files/IPointCloudExporter.h"
