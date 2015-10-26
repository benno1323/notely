class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes, dependent: :destroy

  before_save :default_role
  enum role: [:member]

  def default_role
  	self.role ||= 0
  end
end
