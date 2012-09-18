module CgFacade
  class Loader < CgFacade::Base
    def self.inherited(subclass)
      CgFacade::Facade.register_facade(subclass)
    end
  end
end