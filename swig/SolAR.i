%module solar
%{
#include "SharedBuffer.hpp"
#include "SharedCircularBuffer.hpp"
#include "SharedFifo.hpp"
%}

%include "Swig.i"

///

%include "SharedFifo.hpp"

//%include "SharedFifo.i"
%include "SharedBuffer.hpp"

//%include "SharedFifo.i"
%include "SharedCircularBuffer.hpp"

///

%{
#include <xpcf/xpcf.h>

#include "api/display/I2DOverlay.h"
#include "api/display/I3DOverlay.h"
#include "api/display/I3DPointsViewer.h"
#include "api/display/IImageViewer.h"
#include "api/display/IMatchesOverlay.h"

#include "api/features/IContoursExtractor.h"
#include "api/features/IContoursFilter.h"
#include "api/features/IDescriptorMatcher.h"
#include "api/features/IDescriptorsExtractor.h"
#include "api/features/IDescriptorsExtractorSBPattern.h"
#include "api/features/IKeypointDetector.h"
#include "api/features/IKeypointDetectorRegion.h"
#include "api/features/IKeypointsReIndexer.h"
#include "api/features/IMatchesFilter.h"
#include "api/features/ISBPatternReIndexer.h"

#include "api/fusion/IVisualInertialFusion.h"

#include "api/geom/I2DTransform.h"
#include "api/geom/IProject.h"
#include "api/geom/IUnproject.h"
#include "api/geom/I3DTransform.h"
#include "api/geom/IImage2WorldMapper.h"
#include "api/geom/IUndistortPoints.h"

#include "api/image/IImageConvertor.h"
#include "api/image/IImageFilter.h"
#include "api/image/IImageLoader.h"
#include "api/image/IPerspectiveController.h"

#include "api/input/devices/IARDevice.h"
#include "api/input/devices/ICamera.h"
#include "api/input/devices/ICameraCalibration.h"
#include "api/input/devices/IDepthCamera.h"
#include "api/input/devices/IDevice.h"
#include "api/input/devices/IIMU.h"
#include "api/input/devices/IRGBDCamera.h"

#include "api/input/files/IMarker.h"
#include "api/input/files/IMarker2DNaturalImage.h"
#include "api/input/files/IMarker2DSquared.h"
#include "api/input/files/IMarker2DSquaredBinary.h"
#include "api/input/files/IPointCloudLoader.h"
#include "api/input/files/ITrackableLoader.h"

#include "api/loop/ILoopClosureDetector.h"
#include "api/loop/ILoopCorrector.h"
#include "api/loop/IOverlapDetector.h"

#include "api/pipeline/IMappingPipeline.h"
#include "api/pipeline/IPipeline.h"
#include "api/pipeline/IPoseEstimationPipeline.h"

#include "api/pointCloud/IPCFilter.h"
#include "api/pointCloud/IPCFilterCentroid.h"

#include "api/reloc/IKeyframeRetriever.h"
#include "api/reloc/IRelocalizer.h"

#include "api/sink/ISinkPoseImage.h"
#include "api/sink/ISinkPoseTextureBuffer.h"
#include "api/sink/ISinkReturnCode.h"

#include "api/slam/IBootstrapper.h"
#include "api/slam/IMapping.h"
#include "api/slam/ITracking.h"

#include "api/solver/map/IBundler.h"
#include "api/solver/map/IKeyframeSelector.h"
#include "api/solver/map/IMapFilter.h"
#include "api/solver/map/IMapFusion.h"
#include "api/solver/map/IMapper.h"
#include "api/solver/map/ITriangulator.h"

#include "api/solver/pose/I2D3DCorrespondencesFinder.h"
#include "api/solver/pose/I2Dto3DTransformDecomposer.h"
#include "api/solver/pose/I2Dto3DTransformDecomposerValidation.h"
#include "api/solver/pose/I2DTransformFinder.h"
#include "api/solver/pose/I3D3DCorrespondencesFinder.h"
#include "api/solver/pose/I3DTransformFinderFrom2D2D.h"
#include "api/solver/pose/I3DTransformFinderFrom2D3D.h"
#include "api/solver/pose/I3DTransformFinderFrom3D3D.h"
#include "api/solver/pose/I3DTransformSACFinderFrom2D3D.h"
#include "api/solver/pose/I3DTransformSACFinderFrom3D3D.h"
#include "api/solver/pose/IFiducialMarkerPose.h"
#include "api/solver/pose/IHomographyValidation.h"

#include "api/source/ISourceImage.h"
#include "api/source/ISourceReturnCode.h"

#include "api/storage/ICovisibilityGraph.h"
#include "api/storage/IKeyframesManager.h"
#include "api/storage/IPointCloudManager.h"

#include "api/tracking/IOpticalFlowEstimator.h"
%}

%import (module="XPCF.Core") "XPCF_Core.i"

%inline %{
template <class I>
SRef<I> bindTo(SRef<org::bcom::xpcf::IComponentIntrospect> component)
{
	return component->bindTo<I>();
};
%}

%define BIND_TO_INTERFACE(NAME, TYPE)
%rename(bindTo_ ## NAME) bindTo<TYPE>;
%template(bindTo_ ## NAME) bindTo<TYPE>;
%enddef

/*
//TODO Try to redefine XPCF_DEFINE_BIND_TO_INTERFACE_TRAITS to automatically BIND_TO_INTERFACE
#undef XPCF_DEFINE_BIND_TO_INTERFACE_TRAITS

#define XPCF_DEFINE_BIND_TO_INTERFACE_TRAITS(fullComponentType,uuidString,nameString,descriptionString) \
%warn "900:" ## nameString

%define XPCF_DEFINE_BIND_TO_INTERFACE_TRAITS(fullComponentType,uuidString,nameString,descriptionString)
%warn "900:" ## nameString
%enddef

#undef XPCF_DEFINE_COMPONENT_TRAITS
#define XPCF_DEFINE_COMPONENT_TRAITS(fullComponentType,uuidString,nameString,descriptionString)
*/

%import (module="SolAR.Api.Display")		"SolAR_Api_Display.i"
%import (module="SolAR.Api.Features")		"SolAR_Api_Features.i"
%import (module="SolAR.Api.Fusion")			"SolAR_Api_Fusion.i"
%import (module="SolAR.Api.Geom")			"SolAR_Api_Geom.i"
%import (module="SolAR.Api.Image")			"SolAR_Api_Image.i"
%import (module="SolAR.Api.Input.Devices")	"SolAR_Api_Input_Devices.i"
%import (module="SolAR.Api.Input.Files")	"SolAR_Api_Input_Files.i"
%import (module="SolAR.Api.Loop")			"SolAR_Api_Loop.i"
%import (module="SolAR.Api.Pipeline")		"SolAR_Api_Pipeline.i"
%import (module="SolAR.Api.PointCloud")		"SolAR_Api_PointCloud.i"
%import (module="SolAR.Api.Reloc")			"SolAR_Api_Reloc.i"
%import (module="SolAR.Api.Sink")			"SolAR_Api_Sink.i"
%import (module="SolAR.Api.Slam")			"SolAR_Api_Slam.i"
%import (module="SolAR.Api.Solver.Map")		"SolAR_Api_Solver_Map.i"
%import (module="SolAR.Api.Solver.Pose")	"SolAR_Api_Solver_Pose.i"
%import (module="SolAR.Api.Source")			"SolAR_Api_Source.i"
%import (module="SolAR.Api.Storage")		"SolAR_Api_Storage.i"
%import (module="SolAR.Api.Tracking")		"SolAR_Api_Tracking.i"

%pragma(csharp) moduleimports=%{
    using XPCF.Api;
    using SolAR.Api.Display;
    using SolAR.Api.Features;
    using SolAR.Api.Fusion;
    using SolAR.Api.Geom;
    using SolAR.Api.Image;
    using SolAR.Api.Input.Devices;
    using SolAR.Api.Input.Files;
    using SolAR.Api.Loop;
    using SolAR.Api.Pipeline;
    using SolAR.Api.PointCloud;
    using SolAR.Api.Reloc;
    using SolAR.Api.Sink;
    using SolAR.Api.Slam;
    using SolAR.Api.Solver.Map;
    using SolAR.Api.Solver.Pose;
    using SolAR.Api.Source;
    using SolAR.Api.Storage;
    using SolAR.Api.Tracking;
%}

BIND_TO_INTERFACE(IConfigurable,	xpcf::IConfigurable)

BIND_TO_INTERFACE(I2DOverlay,		SolAR::api::display::I2DOverlay)
BIND_TO_INTERFACE(I3DOverlay,		SolAR::api::display::I3DOverlay)
BIND_TO_INTERFACE(I3DPointsViewer,	SolAR::api::display::I3DPointsViewer)
BIND_TO_INTERFACE(IImageViewer,		SolAR::api::display::IImageViewer)
BIND_TO_INTERFACE(IMatchesOverlay,	SolAR::api::display::IMatchesOverlay)

BIND_TO_INTERFACE(IContoursExtractor,				SolAR::api::features::IContoursExtractor)
BIND_TO_INTERFACE(IContoursFilter,					SolAR::api::features::IContoursFilter)
BIND_TO_INTERFACE(IDescriptorMatcher,				SolAR::api::features::IDescriptorMatcher)
BIND_TO_INTERFACE(IDescriptorsExtractor,			SolAR::api::features::IDescriptorsExtractor)
BIND_TO_INTERFACE(IDescriptorsExtractorSBPattern,	SolAR::api::features::IDescriptorsExtractorSBPattern)
BIND_TO_INTERFACE(IKeypointDetector,				SolAR::api::features::IKeypointDetector)
BIND_TO_INTERFACE(IKeypointDetectorRegion,			SolAR::api::features::IKeypointDetectorRegion)
BIND_TO_INTERFACE(IKeypointsReIndexer,				SolAR::api::features::IKeypointsReIndexer)
BIND_TO_INTERFACE(IMatchesFilter,					SolAR::api::features::IMatchesFilter)
BIND_TO_INTERFACE(ISBPatternReIndexer,				SolAR::api::features::ISBPatternReIndexer)

BIND_TO_INTERFACE(IVisualInertialFusion,	SolAR::api::fusion::IVisualInertialFusion)

BIND_TO_INTERFACE(I2DTransform,			SolAR::api::geom::I2DTransform)
BIND_TO_INTERFACE(IProject,				SolAR::api::geom::IProject)
BIND_TO_INTERFACE(IUnproject,			SolAR::api::geom::IUnproject)
BIND_TO_INTERFACE(I3DTransform,			SolAR::api::geom::I3DTransform)
BIND_TO_INTERFACE(IImage2WorldMapper,	SolAR::api::geom::IImage2WorldMapper)
BIND_TO_INTERFACE(IUndistortPoints,		SolAR::api::geom::IUndistortPoints)

BIND_TO_INTERFACE(IImageConvertor,			SolAR::api::image::IImageConvertor)
BIND_TO_INTERFACE(IImageFilter,				SolAR::api::image::IImageFilter)
BIND_TO_INTERFACE(IImageLoader,				SolAR::api::image::IImageLoader)
BIND_TO_INTERFACE(IPerspectiveController,	SolAR::api::image::IPerspectiveController)

BIND_TO_INTERFACE(IARDevice,			SolAR::api::input::devices::IARDevice)
BIND_TO_INTERFACE(ICamera,				SolAR::api::input::devices::ICamera)
BIND_TO_INTERFACE(ICameraCalibration,	SolAR::api::input::devices::ICameraCalibration)
BIND_TO_INTERFACE(IDepthCamera,			SolAR::api::input::devices::IDepthCamera)
BIND_TO_INTERFACE(IDevice,				SolAR::api::input::devices::IDevice)
BIND_TO_INTERFACE(IIMU,					SolAR::api::input::devices::IIMU)
BIND_TO_INTERFACE(IRGBDCamera,			SolAR::api::input::devices::IRGBDCamera)

BIND_TO_INTERFACE(IMarker,					SolAR::api::input::files::IMarker)
BIND_TO_INTERFACE(IMarker2DNaturalImage,	SolAR::api::input::files::IMarker2DNaturalImage)
BIND_TO_INTERFACE(IMarker2DSquared,			SolAR::api::input::files::IMarker2DSquared)
BIND_TO_INTERFACE(IMarker2DSquaredBinary,	SolAR::api::input::files::IMarker2DSquaredBinary)
BIND_TO_INTERFACE(IPointCloudLoader,		SolAR::api::input::files::IPointCloudLoader)
BIND_TO_INTERFACE(ITrackableLoader,			SolAR::api::input::files::ITrackableLoader)

BIND_TO_INTERFACE(ILoopClosureDetector,	SolAR::api::loop::ILoopClosureDetector)
BIND_TO_INTERFACE(ILoopCorrector,		SolAR::api::loop::ILoopCorrector)
BIND_TO_INTERFACE(IOverlapDetector,		SolAR::api::loop::IOverlapDetector)

BIND_TO_INTERFACE(IMappingPipeline,			SolAR::api::pipeline::IMappingPipeline)
BIND_TO_INTERFACE(IPipeline,				SolAR::api::pipeline::IPipeline)
BIND_TO_INTERFACE(IPoseEstimationPipeline,	SolAR::api::pipeline::IPoseEstimationPipeline)

BIND_TO_INTERFACE(IPCFilter,			SolAR::api::pointCloud::IPCFilter)
BIND_TO_INTERFACE(IPCFilterCentroid,	SolAR::api::pointCloud::IPCFilterCentroid)

BIND_TO_INTERFACE(IKeyframeRetriever,	SolAR::api::reloc::IKeyframeRetriever)
BIND_TO_INTERFACE(IRelocalizer,			SolAR::api::reloc::IRelocalizer)

BIND_TO_INTERFACE(ISinkPoseImage,			SolAR::api::sink::ISinkPoseImage)
BIND_TO_INTERFACE(ISinkPoseTextureBuffer,	SolAR::api::sink::ISinkPoseTextureBuffer)
//BIND_TO_INTERFACE(ISinkReturnCode,			SolAR::api::sink::ISinkReturnCode) // enum class SinkReturnCode: int

BIND_TO_INTERFACE(IBootstrapper,	SolAR::api::slam::IBootstrapper)
BIND_TO_INTERFACE(IMapping,			SolAR::api::slam::IMapping)
BIND_TO_INTERFACE(ITracking,		SolAR::api::slam::ITracking)

BIND_TO_INTERFACE(IBundler,				SolAR::api::solver::map::IBundler)
BIND_TO_INTERFACE(IKeyframeSelector,	SolAR::api::solver::map::IKeyframeSelector)
BIND_TO_INTERFACE(IMapFilter,			SolAR::api::solver::map::IMapFilter)
BIND_TO_INTERFACE(IMapFusion,			SolAR::api::solver::map::IMapFusion)
BIND_TO_INTERFACE(IMapper,				SolAR::api::solver::map::IMapper)
BIND_TO_INTERFACE(ITriangulator,		SolAR::api::solver::map::ITriangulator)

BIND_TO_INTERFACE(I2D3DCorrespondencesFinder,			SolAR::api::solver::pose::I2D3DCorrespondencesFinder)
BIND_TO_INTERFACE(I2Dto3DTransformDecomposer,			SolAR::api::solver::pose::I2Dto3DTransformDecomposer)
BIND_TO_INTERFACE(I2Dto3DTransformDecomposerValidation,	SolAR::api::solver::pose::I2Dto3DTransformDecomposerValidation)
BIND_TO_INTERFACE(I2DTransformFinder,					SolAR::api::solver::pose::I2DTransformFinder)
BIND_TO_INTERFACE(I3D3DCorrespondencesFinder,			SolAR::api::solver::pose::I3D3DCorrespondencesFinder)
BIND_TO_INTERFACE(I3DTransformFinderFrom2D2D,			SolAR::api::solver::pose::I3DTransformFinderFrom2D2D)
BIND_TO_INTERFACE(I3DTransformFinderFrom2D3D,			SolAR::api::solver::pose::I3DTransformFinderFrom2D3D)
BIND_TO_INTERFACE(I3DTransformFinderFrom3D3D,			SolAR::api::solver::pose::I3DTransformFinderFrom3D3D)
BIND_TO_INTERFACE(I3DTransformSACFinderFrom2D3D,		SolAR::api::solver::pose::I3DTransformSACFinderFrom2D3D)
BIND_TO_INTERFACE(I3DTransformSACFinderFrom3D3D,		SolAR::api::solver::pose::I3DTransformSACFinderFrom3D3D)
BIND_TO_INTERFACE(IFiducialMarkerPose,					SolAR::api::solver::pose::IFiducialMarkerPose)
BIND_TO_INTERFACE(IHomographyValidation,				SolAR::api::solver::pose::IHomographyValidation)

BIND_TO_INTERFACE(ISourceImage,			SolAR::api::source::ISourceImage)
//BIND_TO_INTERFACE(ISourceReturnCode,	SolAR::api::source::ISourceReturnCode) // enum class SourceReturnCode: int

BIND_TO_INTERFACE(ICovisibilityGraph,	SolAR::api::storage::ICovisibilityGraph)
BIND_TO_INTERFACE(IKeyframesManager,	SolAR::api::storage::IKeyframesManager)
BIND_TO_INTERFACE(IPointCloudManager,	SolAR::api::storage::IPointCloudManager)

BIND_TO_INTERFACE(IOpticalFlowEstimator,		SolAR::api::tracking::IOpticalFlowEstimator)
