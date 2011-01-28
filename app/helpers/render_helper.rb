module RenderHelper
  include ActsAsTaggableOn::TagsHelper
  def render_collection(name, resource, collection = nil)
    collection ||= resource.send(name) 
    name = name.to_s[0..-2]
    render :partial => "/zap/#{name}s/#{name}", :collection => collection, :locals => {:resource => resource}
  end
  
  def link_to_user(user)
    user ? link_to(user.name, user) : 'Anonymous'
  end
  
  def link_to_space(space)
    link_to(space.name, space)
  end
end