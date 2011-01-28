class Zap::User < ActiveRecord::Base
    include SentientUser
    acts_as_tagger
    
    set_table_name 'users'
    simple_audit :except => [:created_at, :updated_at]

    has_many :authorizations
    has_many :permissions
    has_many :spaces, :through => :permissions, :source => :resource, :source_type => "Space",
      :conditions => "permissions.resource_type = 'Space'"
    has_many :audits

    validates :email, :presence => true, :uniqueness => true
    validates :name, :presence => true

    after_create :create_admin

    def super?
        roles == 'admin'
    end

    def self.find_or_create_from_auth!(hash)
        user_info = hash['user_info']
        user = find_by_email(user_info['email'])
        user = create(:name => user_info['name'], :email => user_info['email']) unless user
        user
    end

    protected

    def create_admin
        self.update_attribute(:roles, 'admin') if self.id == 1
    end
end