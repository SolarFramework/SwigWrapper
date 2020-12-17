%module solar_datastructure
%{
//#include "datastructure/BufferInternal.hpp" //TODO: Does not include its own dependencies
#include "datastructure/CameraDefinitions.h"
#include "datastructure/CloudPoint.h"
#include "datastructure/CoordinateSystem.h"
#include "datastructure/DescriptorBuffer.h"
#include "datastructure/DescriptorMatch.h"
#include "datastructure/FiducialMarker.h"
#include "datastructure/Frame.h"
#include "datastructure/GeometryDefinitions.h"
#include "datastructure/Identification.h"
#include "datastructure/Image.h"
#include "datastructure/Keyframe.h"
#include "datastructure/Keypoint.h"
#include "datastructure/MathDefinitions.h"
#include "datastructure/PointCloud.h"
#include "datastructure/PrimitiveInformation.h"
#include "datastructure/SquaredBinaryPattern.h"
#include "datastructure/Trackable.h"
#include "datastructure/Trackable2D.h"

using namespace SolAR::datastructure;
%}

%include "Swig.i"

%import (module="XPCF.Core") "XPCF_Core.i"
%import (module="SolAR.Core") "SolAR_Core.i"

%typemap(csimports) SWIGTYPE
%{
    //using XPCF.Core;
    using SolAR.Core;
%}

///

// Use System.IntPtr from C# for void* pointers
%apply void *VOID_INT_PTR { void * }
%apply void *VOID_INT_PTR { unsigned char * }

%shared_ptr(SolAR::datastructure::CameraDefinition)
%shared_ptr(SolAR::datastructure::CloudPoint)
%shared_ptr(SolAR::datastructure::CoordinateSystem)
%shared_ptr(SolAR::datastructure::DescriptorBuffer)
%shared_ptr(SolAR::datastructure::DescriptorMatch)
%shared_ptr(SolAR::datastructure::FiducialMarker)
%shared_ptr(SolAR::datastructure::Frame)
%shared_ptr(SolAR::datastructure::GeometryDefinitions)
%shared_ptr(SolAR::datastructure::Identification)
%shared_ptr(SolAR::datastructure::Image)
%shared_ptr(SolAR::datastructure::Keyframe)
%shared_ptr(SolAR::datastructure::Keypoint)
%shared_ptr(SolAR::datastructure::PointCloud)
%shared_ptr(SolAR::datastructure::PrimitiveInformation)
%shared_ptr(SolAR::datastructure::SquaredBinaryPattern)
%shared_ptr(SolAR::datastructure::Trackable)
%shared_ptr(SolAR::datastructure::Trackable2D)
%shared_ptr(SolAR::datastructure::Point2Di)
%shared_ptr(SolAR::datastructure::Point3Di)
%shared_ptr(SolAR::datastructure::Point3Df)
%shared_ptr(SolAR::datastructure::Point2Df)
%shared_ptr(SolAR::datastructure::Contour2Df)

%rename(MapIntCloudPoint) std::map<unsigned int, SolAR::datastructure::CloudPoint, std::less<unsigned int>>;
%template(MapIntCloudPoint) std::map<unsigned int, SolAR::datastructure::CloudPoint, std::less<unsigned int>>;
%rename(MapIntInt) std::map<unsigned int, unsigned int, std::less<unsigned int>>;
%template(MapIntInt) std::map<unsigned int, unsigned int, std::less<unsigned int>>;

// Vector<T>
%rename(DescriptorMatchVector) std::vector<SolAR::datastructure::DescriptorMatch>;
%template(DescriptorMatchVector) std::vector<SolAR::datastructure::DescriptorMatch>;
//SWIG_STD_VECTOR_ENHANCED(SolAR::datastructure::Transform3Df)
//%rename(Transform3DfList) std::vector<SolAR::datastructure::Transform3Df>;
//%template(Transform3DfList) std::vector<SolAR::datastructure::Transform3Df>;
%rename(Transform3DfList) std::vector<Eigen::Transform<float,3,Eigen::Affine, Eigen::RowMajor>>;
%template(Transform3DfList) std::vector<Eigen::Transform<float,3,Eigen::Affine, Eigen::RowMajor>>;
//SWIG_STD_VECTOR_ENHANCED(SolAR::datastructure::Point2Df)
%rename(Point2DfArray) std::vector<SolAR::datastructure::Point2Df>;
%template(Point2DfArray) std::vector<SolAR::datastructure::Point2Df>;
//SWIG_STD_VECTOR_ENHANCED(SolAR::datastructure::Point3Df)
%rename(Point3DfArray) std::vector<SolAR::datastructure::Point3Df>;
%template(Point3DfArray) std::vector<SolAR::datastructure::Point3Df>;
//SWIG_STD_VECTOR_ENHANCED(SolAR::datastructure::Contour2Df)
%rename(Contour2DfArray) std::vector<std::vector<SolAR::datastructure::Point2Df>>;
%template(Contour2DfArray) std::vector<std::vector<SolAR::datastructure::Point2Df>>;
//SWIG_STD_VECTOR_ENHANCED(SolAR::datastructure::Keypoint)
%rename(KeypointArray) std::vector<SolAR::datastructure::Keypoint>;
%template(KeypointArray) std::vector<SolAR::datastructure::Keypoint>;
//SWIG_STD_VECTOR_ENHANCED(SolAR::datastructure::CloudPoint)
%rename(CloudPointVector) std::vector<SolAR::datastructure::CloudPoint>;
%template(CloudPointVector) std::vector<SolAR::datastructure::CloudPoint>;
//SWIG_STD_VECTOR_ENHANCED(unsigned int)
%rename(UIntVector) std::vector<unsigned int>;
%template(UIntVector) std::vector<unsigned int>;
//SWIG_STD_VECTOR_ENHANCED(int)
%rename(IntVector) std::vector<int>;
%template(IntVector) std::vector<int>;


// Vector<SRef<T>>
%rename(DescriptorBufferList) std::vector<SRef<SolAR::datastructure::DescriptorBuffer>>;
%template(DescriptorBufferList) std::vector<SRef<SolAR::datastructure::DescriptorBuffer>>;
%rename(ImageList) std::vector<SRef<SolAR::datastructure::Image>>;
%template(ImageList) std::vector<SRef<SolAR::datastructure::Image>>;
%rename(KeyframeList) std::vector<SRef<SolAR::datastructure::Keyframe>>;
%template(KeyframeList) std::vector<SRef<SolAR::datastructure::Keyframe>>;

///




%ignore SolAR::datastructure::BufferInternal::data() const;
%include "datastructure/BufferInternal.hpp"

%include "datastructure/CameraDefinitions.h"
%include "datastructure/CloudPoint.h"
%include "datastructure/CoordinateSystem.h"

//#include "BufferInternal.i"
%rename (EgalOperator) SolAR::datastructure::DescriptorView::operator=;
%ignore SolAR::datastructure::DescriptorBufferIterator::operator++;
%ignore SolAR::datastructure::DescriptorBufferIterator::operator!=;
%ignore SolAR::datastructure::DescriptorBufferIterator::operator*;
%ignore SolAR::datastructure::DescriptorView::data() const;
%ignore SolAR::datastructure::DescriptorBuffer::data() const;
%include "datastructure/DescriptorBuffer.h"

%include "datastructure/DescriptorMatch.h"
%include "datastructure/FiducialMarker.h"
%include "datastructure/Frame.h"
%include "datastructure/Identification.h"
%include "datastructure/Frame.h"

%rename("$ignore", regextarget=1, fullname=1) "SolAR::datastructure::Point.D.::operator.*$";
%include "datastructure/GeometryDefinitions.h"
%include "datastructure/Identification.h"

%ignore SolAR::datastructure::Image::data() const;
%ignore SolAR::datastructure::Image::extractRegion(Rectanglei region);
%ignore SolAR::datastructure::Image::extractRegion(Rectanglei region, uint32_t channel);
%include "datastructure/Image.h"
%include "datastructure/Keyframe.h"
%include "datastructure/Keypoint.h"

%include "Eigen.i"
%include "datastructure/MathDefinitions.h"
%include "MathDefinitions.i"
%include "datastructure/PointCloud.h"
%include "datastructure/PrimitiveInformation.h"
namespace SolAR {namespace datastructure {class SquaredBinaryPatternMatrix{};}} //TODO: This a matrix with runtime dimensions
%include "datastructure/SquaredBinaryPattern.h"
%include "datastructure/Trackable.h"
%include "datastructure/Trackable2D.h"

///

%inline %{
template <class T>
void * newPointer()
{
	return new SRef<T>();
};
%}

%define EMPTY_POINTER(NAME)
%rename(newPointer_ ## NAME) newPointer<SolAR::datastructure:: ## NAME>;
%template(newPointer_ ## NAME) newPointer<SolAR::datastructure:: ## NAME>;
%enddef

EMPTY_POINTER(BufferInternal)
EMPTY_POINTER(CameraParameters)
EMPTY_POINTER(CamDistortion)
EMPTY_POINTER(CamCalibration)
EMPTY_POINTER(CloudPoint)
EMPTY_POINTER(CoordinateSystem)
EMPTY_POINTER(DescriptorBuffer)
EMPTY_POINTER(DescriptorMatch)
EMPTY_POINTER(FiducialMarker)
EMPTY_POINTER(Frame)
EMPTY_POINTER(Edge2Df)
EMPTY_POINTER(Edge2Di)
EMPTY_POINTER(Point2Df)
EMPTY_POINTER(Contour2Df)
EMPTY_POINTER(Point2Di)
EMPTY_POINTER(Point3Df)
EMPTY_POINTER(Point3Di)
EMPTY_POINTER(Rectanglei)
EMPTY_POINTER(Sizef)
EMPTY_POINTER(Sizei)
EMPTY_POINTER(Identification)
EMPTY_POINTER(Image)
EMPTY_POINTER(Keyframe)
EMPTY_POINTER(Keypoint)
EMPTY_POINTER(Transform2Df)
EMPTY_POINTER(Transform3Df)
EMPTY_POINTER(Vector3f)
EMPTY_POINTER(PointCloud)
EMPTY_POINTER(Primitiveinformation)
EMPTY_POINTER(SquaredBinaryPattern)
EMPTY_POINTER(Trackable)
EMPTY_POINTER(Trackable2D)
