%module solar_api_features
%{
#include "api/features/IContoursExtractor.h"
#include "api/features/IContoursFilter.h"
#include "api/features/ICornerRefinement.h"
#include "api/features/IDescriptorsExtractor.h"
#include "api/features/IDescriptorsExtractorFromImage.h"
#include "api/features/IDescriptorsExtractorSBPattern.h"
#include "api/features/IDescriptorMatcher.h"
#include "api/features/IDescriptorMatcherGeometric.h"
#include "api/features/IDescriptorMatcherRegion.h"
#include "api/features/IDescriptorMatcherStereo.h"
#include "api/features/IFeatureWithDepthFromStereo.h"
#include "api/features/IImageMatcher.h"
#include "api/features/IKeypointDetector.h"
#include "api/features/IKeypointDetectorRegion.h"
#include "api/features/IKeypointsReIndexer.h"
#include "api/features/IMatchesFilter.h"
#include "api/features/ISBPatternReIndexer.h"
#include "base/features/ADescriptorMatcher.h"
#include "base/features/ADescriptorMatcherGeometric.h"
#include "base/features/ADescriptorMatcherRegion.h"
#include "base/features/ADescriptorMatcherStereo.h"
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

%shared_ptr(SolAR::api::features::IContoursExtractor)
%shared_ptr(SolAR::api::features::IContoursFilter)
%shared_ptr(SolAR::api::features::ICornerRefinement)
%shared_ptr(SolAR::api::features::IDescriptorsExtractor)
%shared_ptr(SolAR::api::features::IDescriptorsExtractorFromImage)
%shared_ptr(SolAR::api::features::IDescriptorsExtractorSBPattern)
%shared_ptr(SolAR::api::features::IDescriptorMatcher)
%shared_ptr(SolAR::api::features::IDescriptorMatcherGeometric)
%shared_ptr(SolAR::api::features::IDescriptorMatcherRegion)
%shared_ptr(SolAR::api::features::IDescriptorMatcherStereo)
%shared_ptr(SolAR::api::features::IFeatureWithDepthFromStereo)
%shared_ptr(SolAR::api::features::IImageMatcher)
%shared_ptr(SolAR::api::features::IKeypointDetector)
%shared_ptr(SolAR::api::features::IKeypointDetectorRegion)
%shared_ptr(SolAR::api::features::IKeypointsReIndexer)
%shared_ptr(SolAR::api::features::IMatchesFilter)
%shared_ptr(SolAR::api::features::ISBPatternReIndexer)
%shared_ptr(SolAR::base::features::ADescriptorMatcher)
%shared_ptr(SolAR::base::features::ADescriptorMatcherGeometric)
%shared_ptr(SolAR::base::features::ADescriptorMatcherRegion)
%shared_ptr(SolAR::base::features::ADescriptorMatcherStereo)

///

%include "api/features/IContoursExtractor.h"

%include "api/features/IContoursFilter.h"
%include "api/features/ICornerRefinement.h"

%include "api/features/IDescriptorsExtractorFromImage.h"

%include "api/features/IDescriptorsExtractor.h"

%include "api/features/IDescriptorsExtractorSBPattern.h"

%include "api/features/IDescriptorMatcher.h"

%include "api/features/IDescriptorMatcherGeometric.h"

%include "api/features/IDescriptorMatcherRegion.h"

%include "api/features/IDescriptorMatcherStereo.h"

%include "api/features/IFeatureWithDepthFromStereo.h"

%include "api/features/IImageMatcher.h"

%include "api/features/IKeypointDetector.h"

//#include "api/features/IKeypointDetector.h"
%include "api/features/IKeypointDetectorRegion.h"

//#include "api/features/IDescriptorMatcher.h"
%include "api/features/IKeypointsReIndexer.h"

%include "api/features/IMatchesFilter.h"

//#include "api/features/IDescriptorMatcher.h"
%include "api/features/ISBPatternReIndexer.h"

%include "base/features/ADescriptorMatcher.h"

%include "base/features/ADescriptorMatcherGeometric.h"

%include "base/features/ADescriptorMatcherRegion.h"

%include "base/features/ADescriptorMatcherStereo.h"


