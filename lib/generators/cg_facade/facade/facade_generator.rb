require 'rails/generators'

module CgFacade
  module Generators
    class FacadeGenerator < Rails::Generators::NamedBase 
      argument :actions, :type => :array, :default => [], :banner => "action action"
      class_option :facade_class, :type => :string, :default => "base", :desc=> "Indicates the class name of the Facade (Base, Loader)"

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end
      
      def create_facade_files
        return raise "Invalid class name for Facade. Please use Base or Loader" unless %W(Base Loader).include?(options.facade_class.camelize)
        template 'facade.rb', File.join('app/facades', class_path, "#{file_name}_facade.rb")
      end

    end
  end
end
