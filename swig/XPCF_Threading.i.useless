%module xpcf_threading
%{
#include "xpcf/threading/BaseTask.h"
#include "xpcf/threading/DropBuffer.h"
#include "xpcf/threading/FiberFifos.h"
#include "xpcf/threading/ITask.h"
#include "xpcf/threading/MultiConsumer.h"
#include "xpcf/threading/SharedBuffer.h"
#include "xpcf/threading/SharedCircularBuffer.h"
#include "xpcf/threading/SharedFifo.h"
#include "xpcf/threading/SharedLifo.h"
%}

%include "Swig.i"

%import (module="XPCF.Core") "XPCF_Core.i"

%typemap(csimports) SWIGTYPE
%{
	using XPCF.Core;
%}

///

%shared_ptr(org::bcom::xpcf::IFinalize)
%shared_ptr(org::bcom::xpcf::ITask)
%shared_ptr(org::bcom::xpcf::AbstractTask)
%shared_ptr(org::bcom::xpcf::BaseTask)
%shared_ptr(org::bcom::xpcf::AbstractDelegateTask)
%shared_ptr(org::bcom::xpcf::DelegateTask)
%shared_ptr(org::bcom::xpcf::FiberTask)

///

%include "xpcf/threading/SharedFifo.h"

//#include <xpcf/threading/SharedFifo.h>
%ignore org::bcom::xpcf::ITaskFactory::newTask(std::function<void(void)> command);
%ignore org::bcom::xpcf::IExecutor::execute(std::function<void(void)> command);
%include "xpcf/threading/ITask.h"

//#include "xpcf/threading/ITask.h"
//#include "xpcf/threading/SharedFifo.h"
%ignore org::bcom::xpcf::DelegateTask; //TODO Only ignore std::function
%ignore org::bcom::xpcf::FiberTask; //TODO Only ignore std::function
%include "xpcf/threading/BaseTask.h"

//#include "xpcf/threading/SharedFifo.h"
%include "xpcf/threading/SharedLifo.h"

//#include "xpcf/threading/SharedLifo.h"
%include "xpcf/threading/DropBuffer.h"

//#include "xpcf/threading/SharedFifo.h"
%include "xpcf/threading/SharedBuffer.h"

//#include "xpcf/threading/SharedBuffer.h"
%include "xpcf/threading/MultiConsumer.h"

//#include "xpcf/threading/SharedFifo.h"
%include "xpcf/threading/SharedCircularBuffer.h"

//#include "xpcf/threading/SharedCircularBuffer.h"
//%include "xpcf/threading/FiberFifos.h" //TODO Error
