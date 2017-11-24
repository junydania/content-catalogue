class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  enum role: [:standard, :administrator, :guest]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of  :encrypted_password, :email


  def fullname
    "#{first_name} #{last_name}"
  end

end


