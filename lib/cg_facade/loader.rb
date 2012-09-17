module CgFacade
  class Loader
    def self.inherited(subclass)
      CgFacade::Facade.register_facade(subclass)
    end
  end
end