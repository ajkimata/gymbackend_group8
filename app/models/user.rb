class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # belongs_to :role, polymorphic: true
  belongs_to :role, polymorphic: true, class_name: 'Trainer', optional: true

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # def jwt_payload
  #   super
  # end
end
