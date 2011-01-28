module ActionsHelper
  def actions_for(model, user = current_user)
    
    content_tag(:div, :class => 'actions') do
      (link_to 'Editar', edit_polymorphic_path(model)) << 
      (link_to 'Borrar', model, :method => :delete, :confirmation => "¿Estás seguro?")
    end
  end
end