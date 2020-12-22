%module solar_api_storage
%{
#include "api/storage/ICovisibilityGraph.h"
#include "api/storage/IKeyframesManager.h"
#include "api/storage/IPointCloudManager.h"
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

%shared_ptr(SolAR::api::storage::ICovisibilityGraph)
%shared_ptr(SolAR::api::storage::IKeyframesManager)
%shared_ptr(SolAR::api::storage::IPointCloudManager)

///

%include "api/storage/ICovisibilityGraph.h"

%ignore SolAR::api::storage::IKeyframesManager::addKeyframe(const datastructure::Keyframe & keyframe);
%include "api/storage/IKeyframesManager.h"

%ignore SolAR::api::storage::IPointCloudManager::addPoint(const datastructure::CloudPoint & point);
%include "api/storage/IPointCloudManager.h"
