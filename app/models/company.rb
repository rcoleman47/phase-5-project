class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :subcontractors, dependent: :destroy
  has_many :contacts, through: :subcontractors

  after_initialize :init

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  # validates :phone_number, presence: true

  def init
    self.logo ||='https://www.adaptivewfs.com/wp-content/uploads/2020/07/logo-placeholder-image.png' 
  end

end
