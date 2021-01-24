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

%rename(UIntSet) std::set<uint32_t>;
%template(UIntSet) std::set<uint32_t>;
namespace std{template<typename A,typename B,typename C> class tuple{};}
%rename(IIFTuple) std::tuple<uint32_t, uint32_t, float>;
%template(IIFTuple) std::tuple<uint32_t, uint32_t, float>;
%rename(IIFTupleVector) std::vector<std::tuple<uint32_t, uint32_t, float>>;
%template(IIFTupleVector) std::vector<std::tuple<uint32_t, uint32_t, float>>;
%apply float *OUTPUT {float & weight};
//%apply float *OUTPUT {std::set<uint32_t> & nodes_id};
//%apply float *OUTPUT {std::vector<uint32_t> & neighbors};
//%apply float *OUTPUT {std::vector<std::tuple<uint32_t, uint32_t, float>> & edges_weights};
%apply float *OUTPUT {float & minTotalWeights};
%apply float *OUTPUT {float & maxTotalWeights};
//%apply float *OUTPUT {std::vector<uint32_t> & path};
%include "api/storage/ICovisibilityGraph.h"
%clear float & weight;
%clear float & minTotalWeights;
%clear float & maxTotalWeights;

%ignore SolAR::api::storage::IKeyframesManager::addKeyframe(const datastructure::Keyframe & keyframe);
%include "api/storage/IKeyframesManager.h"

%ignore SolAR::api::storage::IPointCloudManager::addPoint(const datastructure::CloudPoint & point);
%ignore SolAR::api::storage::IPointCloudManager::addPoints(const std::vector<datastructure::CloudPoint> & points);
%include "api/storage/IPointCloudManager.h"
