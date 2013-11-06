class User < ActiveRecord::Base
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

end
