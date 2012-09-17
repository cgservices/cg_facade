require 'cg_facade/base'
require 'cg_facade/facade'
require 'cg_facade/loader'

# Loop through app/facade to to register all CgFacade::Loader classes
# Gem.loaded_specs.each do |g|

puts "Registering Facades..."
Gem.loaded_specs["cg_facade"].dependent_gems.each do |g|
  Dir.glob(File.dirname(__FILE__) + '/helpers/*', &method(:require))
  Dir.glob("#{g.first.full_gem_path}/app/facades/**/*.rb") do |rb_file|
    require rb_file
    class_name = g.first.name.camelize + "::" +File.basename(rb_file, ".rb").camelize
    class_name.constantize.new
  end
end

# CgFacade::Facade.engines.each do |e|
#   Gem.loaded_specs[e].each do |g|
#     
#   end
# end