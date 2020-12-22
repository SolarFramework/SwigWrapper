%module solar_api_loop
%{
#include "api/loop/ILoopClosureDetector.h"
#include "api/loop/ILoopCorrector.h"
#include "api/loop/IOverlapDetector.h"
%}

%include "Swig.i"

%import (module="XPCF.Api") "XPCF_Api.i"
%import (module="SolAR.Core") "SolAR_Core.i"
%import (module="SolAR.Datastructure") "SolAR_Datastructure.i"
%import (module="SolAR.Api.Solver.Map") "SolAR_Api_Solver_Map.i"

%typemap(csimports) SWIGTYPE
%{
    using XPCF.Api;
    using SolAR.Core;
    using SolAR.Datastructure;
    using SolAR.Api.Solver.Map;
%}

///

%shared_ptr(SolAR::api::loop::ILoopClosureDetector)
%shared_ptr(SolAR::api::loop::ILoopCorrector)
%shared_ptr(SolAR::api::loop::IOverlapDetector)

///

%include "api/loop/ILoopClosureDetector.h"

%include "api/loop/ILoopCorrector.h"

%include "api/loop/IOverlapDetector.h"
