class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  belongs_to :tenant
  belongs_to :role


  before_create :set_default_tenant, :set_default_role

  private

  def set_default_tenant
    self.tenant ||= Tenant.find_by_id(1)
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end

end
