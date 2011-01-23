module Zap::ZapHelper
  def title(title)
    content_for(:title, title)
    content_tag :h1, title
  end

  def cancel_submit(model)
    link_to 'Cancelar', polymorphic_url(model)
  end

  def avatar_url(user, size = 48)
    if user.avatar_url.present?
      user.avatar_url
    else
      email = user.email ? user.email.downcase : "nouser@plataformabooka.net"
      gravatar_id = Digest::MD5.hexdigest(email)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
    end
  end

  def breadcrumbs(model)
    name = model.class.name.demodulize.downcase
    content_tag(:h3, (link_to(t("zap.collection.#{name}s"), "zap_#{name}s".to_sym) +
          content_tag(:span, " > #{t("zap.model.#{name}")}")))
  end

  def thead_for(clazz, *attributes)
    content_tag :thead do
      content_tag :tr do
        attributes.collect {|att| concat(content_tag(:td, clazz.human_attribute_name(att))) }
      end
    end
  end

  def section_for(name)
    content_tag(:h2, name.to_s, :class => 'section')
  end

  def actions(tag = nil, model = nil, &block)
    tag ||= :div
    if block_given?
      content_tag(tag, :class => "actions", &block)
    else
      content_tag(tag, :class => 'actions') do
        concat(link_to t('zap.actions.edit'), polymorphic_path([:edit, model]))
      end
    end
  end


  def properties(&block)
    content_tag(:ul, :class => "properties", &block)
  end

  def property(model, name, value = nil)
    value ||= model.send(name)
    content_tag :li do
      content_tag(:label, "#{model.class.human_attribute_name(name)}:") + value
    end
  end
end
