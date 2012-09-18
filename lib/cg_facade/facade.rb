module CgFacade
  class Facade
    cattr_accessor :loader_facades

    class << self
      # Add klass to loader facade
      def register_facade(klass)
        self.loader_facades ||= []
        self.loader_facades.delete_if{|f| f.to_s == klass.to_s}
        self.loader_facades << klass
      end

      # Return the name of the modules that implement facade
      def find_modules_by_name(facade)
        modules = []
        find_facades_by_name(facade).each do |f|
          modules << f.to_s.split("::").first
        end
        modules.uniq
      end

      def find_facades_by_name(facade)
        self.loader_facades.select{|f| f.to_s.split("::").last == facade}
      end
    end


  end
end