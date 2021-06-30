%module solar_api_solver_map
%{
#include "api/solver/map/IBundler.h"
#include "api/solver/map/IKeyframeSelector.h"
#include "api/solver/map/IMapFilter.h"
#include "api/solver/map/IMapFusion.h"
#include "api/solver/map/IMapUpdate.h"
#include "api/solver/map/ITriangulator.h"
%}

%include "Swig.i"

%import (module="XPCF.Api") "XPCF_Api.i"
%import (module="SolAR.Core") "SolAR_Core.i"
%import (module="SolAR.Datastructure") "SolAR_Datastructure.i"
%import (module="SolAR.Api.Storage") "SolAR_Api_Storage.i"
%import (module="SolAR.Api.Reloc") "SolAR_Api_Reloc.i"

%typemap(csimports) SWIGTYPE
%{
    using XPCF.Api;
    using SolAR.Core;
    using SolAR.Datastructure;
    using SolAR.Api.Reloc;
    using SolAR.Api.Storage;
%}

///

%shared_ptr(SolAR::api::solver::map::IBundler)
%shared_ptr(SolAR::api::solver::map::IKeyframeSelector)
%shared_ptr(SolAR::api::solver::map::IMapFilter)
%shared_ptr(SolAR::api::solver::map::IMapFusion)
%shared_ptr(SolAR::api::solver::map::IMapUpdate)
%shared_ptr(SolAR::api::solver::map::ITriangulator)

%rename(IntList) std::vector<int>;
%template(IntList) std::vector<int>;
%rename(PairUIntUInt) std::pair<unsigned int, unsigned int>;
%template(PairUIntUInt) std::pair<unsigned int, unsigned int>;

///

%include "api/solver/map/IKeyframeSelector.h"

%include "api/solver/map/IMapFilter.h"

%include "api/solver/map/IMapUpdate.h"

%include "api/solver/map/ITriangulator.h"

//#include "api/solver/map/IBundler.h"
%include "api/solver/map/IBundler.h"

//#include "api/solver/map/IMapFusion.h"
%include "api/solver/map/IMapFusion.h"
