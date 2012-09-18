<% module_namespacing do -%>
class <%= class_name %>Facade < CgFacade::<%= options.facade_class.camelize %>
<% actions.each do |action| -%>
  def <%= action.underscore %>
  end
<%= "\n" unless action == actions.last -%>
<% end -%>
end
<% end -%>