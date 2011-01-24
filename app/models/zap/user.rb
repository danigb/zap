class Zap::User < ActiveRecord::Base
  include SentientUser
  
  set_table_name 'users'
  simple_audit :except => [:created_at, :updated_at]

  has_many :authorizations
  has_many :memberships do
    def admin
      where(:level => 'admin')
    end
  end
  has_many :spaces, :through => :memberships
  has_many :audits


  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

  after_create :create_admin

  def admin?
    roles == 'admin'
  end

  def super?
    roles == 'admin'
  end

  def self.find_or_create_from_auth!(hash)
    user_info = hash['user_info']
    user = find_by_email(user_info['email'])
    user = create(:name => user_info['name'], :avatar_url => user_info['image'],
      :email => user_info['email']) unless user
    user
  end

  protected
  def create_admin
    self.update_attribute(:roles, 'admin') if self.id == 1
  end
end