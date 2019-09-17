%module xpcf_api
%{
#include "xpcf/api/ComponentMetadata.h"
#include "xpcf/api/IComponentIntrospect.h"
#include "xpcf/api/IComponentManager.h"
#include "xpcf/api/IConfigurable.h"
#include "xpcf/api/IInjectable.h"
#include "xpcf/api/InjectableMetadata.h"
#include "xpcf/core/Exception.h"
#include "xpcf/module/IModuleIndex.h"
#include "xpcf/api/IModuleManager.h"
#include "xpcf/api/InterfaceMetadata.h"
#include "xpcf/api/ModuleMetadata.h"
#include "xpcf/xpcf.h"
%}

%include "Swig.i"

%import (module="XPCF.Core") "XPCF_Core.i"
%import (module="XPCF.Collection") "XPCF_Collection.i"
%import (module="XPCF.Properties") "XPCF_Properties.i"
%import (module="XPCF.Traits") "XPCF_Traits.i"

%typemap(csimports) SWIGTYPE
%{
    using XPCF.Core;
    using XPCF.Collection;
    using XPCF.Properties;
    using XPCF.Traits;
%}

///

%shared_ptr(org::bcom::xpcf::ComponentMetadata)
%shared_ptr(org::bcom::xpcf::IComponentIntrospect)
%shared_ptr(org::bcom::xpcf::IComponentManager)
%shared_ptr(org::bcom::xpcf::IConfigurable)
%shared_ptr(org::bcom::xpcf::IInjectable)
%shared_ptr(org::bcom::xpcf::IModuleManager)
%shared_ptr(org::bcom::xpcf::InterfaceMetadata)
%shared_ptr(org::bcom::xpcf::ModuleMetadata)

///

%ignore org::bcom::xpcf::InterfaceMetadata::InterfaceMetadata(const InterfaceMetadata & other);
%ignore org::bcom::xpcf::InterfaceMetadata::operator=;
%ignore org::bcom::xpcf::InterfaceMetadata::operator==;
//%nodefaultctor org::bcom::xpcf::InterfaceMetadata;
%include "xpcf/api/InterfaceMetadata.h"

//#include "xpcf/api/InterfaceMetadata.i"
namespace boost{namespace filesystem{}}
%ignore org::bcom::xpcf::ComponentMetadata::ComponentMetadata(const ComponentMetadata & other);
%ignore org::bcom::xpcf::ComponentMetadata::operator=;
%ignore org::bcom::xpcf::ComponentMetadata::operator==;
%include "xpcf/api/ComponentMetadata.h"

//#include "xpcf/api/ComponentMetadata.i"
%ignore org::bcom::xpcf::IModuleIndex; //TODO Multiple inheritance
//%interface_impl(org::bcom::xpcf::IModuleIndex);
//%shared_ptr(org::bcom::xpcf::IModuleIndex)
%include "xpcf/module/IModuleIndex.h"

//#include "xpcf/api/IModuleIndex.i"
//#include "xpcf/api/InterfaceMetadata.i"
%ignore org::bcom::xpcf::ModuleMetadata::getFullPath() const;
%include "xpcf/api/ModuleMetadata.h"

//#include "xpcf/api/InterfaceMetadata.i"
%ignore org::bcom::xpcf::IComponentIntrospect::getMetadata;
%include "xpcf/api/IComponentIntrospect.h"
%rename(queryInterface) org::bcom::xpcf::IComponentIntrospect::queryInterface<org::bcom::xpcf::IComponentIntrospect>;
%template(queryInterface) org::bcom::xpcf::IComponentIntrospect::queryInterface<org::bcom::xpcf::IComponentIntrospect>;

//#include <xpcf/api/IComponentIntrospect.h>
//#include <xpcf/api/InjectableMetadata.h>
//#include <xpcf/core/uuid.h>
//#include <xpcf/core/XPCFErrorCode.h>
//TODO instanciate templates
%ignore org::bcom::xpcf::IInjectable::getInjectables;
%ignore org::bcom::xpcf::IInjectable::inject;
%ignore org::bcom::xpcf::IInjectable::injectExists;
%include "xpcf/api/IInjectable.h"
/*
%template(inject) org::bcom::xpcf::IInjectable::inject<org::bcom::xpcf::IComponentIntrospect>(SRef<IComponentIntrospect> instance);
template <typename I> void inject(SRef<I> instance);
template <typename I> void inject(SRef<IComponentIntrospect> instance);
template <typename I> void inject(SRef<I> instance, const char * name);
template <typename I> void inject(SRef<IComponentIntrospect> instance, const char * name);
template <typename I> bool injectExists() const;
template <typename I> bool injectExists(const char * name) const;
*/

//#include "xpcf/api/IInjectable.i"
//#include "xpcf/api/InterfaceMetadata.i"
//#include "xpcf/api/ComponentMetadata.i"
//#include "xpcf/api/ModuleMetadata.i"
%include "xpcf/api/IComponentManager.h"

//#include "xpcf/api/IComponentIntrospect.i"
%ignore getProperty;
%include "xpcf/api/IConfigurable.h"

//#include "xpcf/api/IComponentIntrospect.i"
//#include "xpcf/api/ModuleMetadata.i"
%include "xpcf/api/IModuleManager.h"

//#include "xpcf/api/IComponentManager.i"
//#include "xpcf/api/IConfigurable.i"
%include "xpcf/xpcf.h"

//#include "IComponentIntrospect.h"
//#include <xpcf/core/uuid.h>
%include "xpcf/api/InjectableMetadata.h"

//#include "xpcf/core/uuid.i"
//#include "xpcf/core/xpcf_api_define.i"
//#include "xpcf/core/XPCFErrorCode.i"
//#include "xpcf/api/InjectableMetadata.h"
%ignore std::runtime_error;
namespace std{class runtime_error {};}
%ignore org::bcom::xpcf::Exception::Exception(const std::string & what, XPCFErrorCode errCode = XPCFErrorCode::_FAIL);
%ignore org::bcom::xpcf::AccessDeniedException::AccessDeniedException(const std::string & what);
%ignore org::bcom::xpcf::IllegalStateException::IllegalStateException(const std::string & what);
%ignore org::bcom::xpcf::ModuleException::ModuleException(const std::string & what, XPCFErrorCode errCode = XPCFErrorCode::_FAIL);
%ignore org::bcom::xpcf::NotImplementedException::NotImplementedException(const std::string & what);
%ignore org::bcom::xpcf::NullPointerException::NullPointerException(const std::string & what);
%ignore org::bcom::xpcf::TimeoutException::TimeoutException(const std::string & what);
%ignore org::bcom::xpcf::UUIDNotFoundException::UUIDNotFoundException(const std::string & what, XPCFErrorCode errCode = XPCFErrorCode::_FAIL);
%ignore org::bcom::xpcf::ComponentNotFoundException::ComponentNotFoundException(const std::string & what);
%ignore org::bcom::xpcf::InterfaceNotImplementedException::InterfaceNotImplementedException(const std::string & what);
%ignore org::bcom::xpcf::ModuleNotFoundException::ModuleNotFoundException(const std::string & what);
%ignore org::bcom::xpcf::InjectionException::InjectionException(const std::string & what, XPCFErrorCode errCode = XPCFErrorCode::_FAIL);
%ignore org::bcom::xpcf::InjectableNotFoundException::InjectableNotFoundException(const std::string & what);
%ignore org::bcom::xpcf::InjectableDeclarationException::InjectableDeclarationException(const std::string & what);
%include "xpcf/core/Exception.h"


