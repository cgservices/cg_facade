<% module_namespacing do -%>
class <%= class_name %>Facade < CgFacade::Base
<% actions.each do |action| -%>
  def <%= action %>
  end
<%= "\n" unless action == actions.last -%>
<% end -%>
end
<% end -%>