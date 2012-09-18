# CG Facade
Gem to implement facades in Rails Engines. Facades are used for inter engine communication.

## Installation
### In Gemfile
gem 'cg_facade', :git => "https://github.com/cgservices/digital_codes.git"

## Usage
There are 2 types of Facades.
  - Facade::Base
  - Facade::Loader

### Facade::Base
The Facade::Base class is used to create a simplified interface for other modules to communicate with the engine.

You can generate Base Facades in app/facades by using the generator
    rails g cg_facade:facade MyFacade --facade_type=Base


### Facade::Loader
The Facade::Loader class is used to implement functionality needed by other engines. The Loader classes are registered in the Facade class and made accessible throughout the application

You can generate Loader Facades in app/facades by using the generator
    rails g cg_facade:facade MyFacade --facade_type=Loader

### Accessing a Facade from outside the engine
A facade is used for inter engine communication. To access a facade you can simply call the Facade function that is implemented in the engine
#### Base Facade in Contacts Engine
    module Contacts
      class ContactsFacade < CgFacade::Base
        class << self
          def all_contacts
            Contacts::Contact.all
          end
        end
      end
    end

#### Call from other Engine
    @contacts = Contacts::ContactsFacade.all_contacts

#### Loader Facade in Contacts Engine
    module Contacts
      class MessagesFacade < CgFacade::Loader
        def collection
          Contacts::Contact.all.map{|c| {:name => "#{c.name}", :email =>"#{c.email}"}}
        end
      end
    end

#### Call from Messages Engine
    # Returns all Engines that implement a MessagesFacade
    @modules = CgFacade::Facade.find_modules_by_name("MessagesFacade")

    # Returns all the MessagesFacade classes
    CgFacade::Facade.find_facades_by_name("MessagesFacade")
