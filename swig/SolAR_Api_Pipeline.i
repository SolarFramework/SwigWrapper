%module solar_api_pipeline
%{
#include "api/pipeline/IMappingPipeline.h"
#include "api/pipeline/IMapUpdatePipeline.h"
#include "api/pipeline/IPipeline.h"
#include "api/pipeline/IPoseEstimationPipeline.h"
#include "api/pipeline/IRelocalizationPipeline.h"
%}

%include "Swig.i"

%import (module="XPCF.Api") "XPCF_Api.i"
%import (module="SolAR.Core") "SolAR_Core.i"
%import (module="SolAR.Datastructure") "SolAR_Datastructure.i"
%import (module="SolAR.Api.Sink") "SolAR_Api_Sink.i"
%import (module="SolAR.Api.Source") "SolAR_Api_Source.i"

%typemap(csimports) SWIGTYPE
%{
    using XPCF.Api;
    using SolAR.Core;
    using SolAR.Datastructure;
    using SolAR.Api.Sink;
    using SolAR.Api.Source;
%}

///

%shared_ptr(SolAR::api::pipeline::IMappingPipeline)
%shared_ptr(SolAR::api::pipeline::IMapUpdatePipeline)
%shared_ptr(SolAR::api::pipeline::IPipeline)
%shared_ptr(SolAR::api::pipeline::IPoseEstimationPipeline)
%shared_ptr(SolAR::api::pipeline::IRelocalizationPipeline)

///

%include "api/pipeline/IPipeline.h"

//#include "api/pipeline/IMappingPipeline.h"
%include "api/pipeline/IMappingPipeline.h"

//#include "api/pipeline/IMapUpdatePipeline.h"
%include "api/pipeline/IMapUpdatePipeline.h"

//#include "api/pipeline/IPoseEstimationPipeline.h"
%include "api/pipeline/IPoseEstimationPipeline.h"

//#include "api/pipeline/IRelocalizationPipeline.h"
%include "api/pipeline/IRelocalizationPipeline.h"
