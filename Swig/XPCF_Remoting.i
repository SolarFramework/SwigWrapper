%module xpcf_remoting
%{
#include "xpcf/remoting/BaseBuffer.h"
#include "xpcf/remoting/IGrpcServerManager.h"
#include "xpcf/remoting/IGrpcService.h"
#include "xpcf/remoting/ISerializable.h"
%}

%include "Swig.i"

%import (module="XPCF.Core") "XPCF_Core.i"
%import (module="XPCF.Api") "XPCF_Api.i"

%typemap(csimports) SWIGTYPE
%{
	using XPCF.Core;
	using XPCF.Api;
%}

///

%shared_ptr(org::bcom::xpcf::IGrpcServerManager)
%shared_ptr(org::bcom::xpcf::IGrpcService)

///

%ignore org::bcom::xpcf::BaseBuffer::data() const;
%ignore org::bcom::xpcf::BaseBuffer;
%include "xpcf/remoting/BaseBuffer.h"

//#include <xpcf/remoting/BaseBuffer.h>
//%include "xpcf/remoting/ISerializable.h" //TODO Error

namespace grpc {class Service {};}
%include "xpcf/remoting/IGrpcService.h"

//#include <xpcf/remoting/IGrpcService.h>
%ignore org::bcom::IGrpcServerManager;
%ignore org::bcom::xpcf::IGrpcServerManager::registerService;
%include "xpcf/remoting/IGrpcServerManager.h"
