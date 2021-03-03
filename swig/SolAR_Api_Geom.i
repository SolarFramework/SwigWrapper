%module solar_api_geom
%{
#include "api/geom/I2DTransform.h"
#include "api/geom/IProject.h"
#include "api/geom/IUnproject.h"
#include "api/geom/I3DTransform.h"
#include "api/geom/IImage2WorldMapper.h"
#include "api/geom/IUndistortPoints.h"
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

%shared_ptr(SolAR::api::geom::I2DTransform)
%shared_ptr(SolAR::api::geom::IProject)
%shared_ptr(SolAR::api::geom::IUnproject)
%shared_ptr(SolAR::api::geom::I3DTransform)
%shared_ptr(SolAR::api::geom::IImage2WorldMapper)
%shared_ptr(SolAR::api::geom::IUndistortPoints)

///

%include "api/geom/I2DTransform.h"

%include "api/geom/IProject.h"

%include "api/geom/IUnproject.h"

%include "api/geom/I3DTransform.h"

%include "api/geom/IImage2WorldMapper.h"

%include "api/geom/IUndistortPoints.h"
