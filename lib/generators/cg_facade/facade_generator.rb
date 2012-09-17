require 'rails/generators'

module CgFacade
  module Generators
    class FacadeGenerator < Rails::Generators::NamedBase 
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end
      
      def create_facade_files
        template 'facade.rb', File.join('app/facade', class_path, "#{file_name}_facade.rb")
      end

    end
  end
end
