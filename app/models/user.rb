class User < ActiveRecord::Base
  ROLES = %w[admin moderator member guest banned]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :confirmable,
         :lockable, :omniauthable
         #TODO uncomment confirmable after exiting alpha release
 has_many :entries
 has_many :contests
 has_many :characters
 has_many :battles

 before_create :on_before_create
 def on_before_create
   self.role ||= 'member'
   self.username = self.email if self.username.nil? || self.username.empty? || User.pluck(:username).include?(self.username)
 end

 def is?(role)
   self.role == role.to_s
 end

 def contest_ids
   self.entries.pluck(:contest_id)
 end
end
