class User < ActiveRecord::Base
  ROLES = %w[admin moderator member banned]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :confirmable,
         :lockable, :omniauthable
         #TODO uncomment confirmable before release
 has_many :entries
 has_many :contests
 has_many :characters

 before_create :on_before_create
 def on_before_create
   self.role ||= 'member'
 end

 def is?(role)
   self.role == role.to_s
 end

end
