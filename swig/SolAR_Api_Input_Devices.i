%module solar_api_input_devices
%{
#include "api/input/devices/IARDevice.h"
#include "api/input/devices/ICamera.h"
#include "api/input/devices/ICameraCalibration.h"
#include "api/input/devices/IDepthCamera.h"
#include "api/input/devices/IDevice.h"
#include "api/input/devices/IIMU.h"
#include "api/input/devices/IRGBDCamera.h"
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

%shared_ptr(SolAR::api::input::devices::IARDevice)
%shared_ptr(SolAR::api::input::devices::ICamera)
%shared_ptr(SolAR::api::input::devices::ICameraCalibration)
%shared_ptr(SolAR::api::input::devices::IDepthCamera)
%shared_ptr(SolAR::api::input::devices::IDevice)
%shared_ptr(SolAR::api::input::devices::IIMU)
%shared_ptr(SolAR::api::input::devices::IRGBDCamera)

///

%include "api/input/devices/IDevice.h"

//#include "api/input/devices/IDevice.h"
%include "api/input/devices/IARDevice.h"

//#include "api/input/devices/IDevice.h"
%include "api/input/devices/ICamera.h"

%include "api/input/devices/ICameraCalibration.h"

//#include "api/input/devices/IDevice.h"
%include "api/input/devices/IDepthCamera.h"

//#include "api/input/devices/IDevice.h"
%include "api/input/devices/IIMU.h"

//#include "api/input/devices/IDevice.h"
//#include "api/input/devices/ICamera.h"
//#include "api/input/devices/IDepthCamera.h"
%ignore SolAR::api::input::devices::IRGBDCamera;
%include "api/input/devices/IRGBDCamera.h"
