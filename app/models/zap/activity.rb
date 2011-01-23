class Zap::Activity < ActiveRecord::Base
  set_table_name 'activities'
  belongs_to :user

  validates :action, :presence => true
  validates :resource_class, :presence => true
  validates :resource, :presence => true
  
  def self.register(controller, user)
    action = controller.request.params[:action]
    if action == 'create' or action == 'update' or action == 'destroy'
      model_id = action == 'create' ? nil : controller.request.params[:id]
      Zap::Activity.create(:action => action, :resource_class => controller.send(:resource_class), :resource_id => model_id, :user_id => user.id)
    end
  end

end
