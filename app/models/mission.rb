class Mission < ApplicationRecord
  # belongs_to :user
  
  enum priority:{ important: 0, normal: 1 }
  enum status:{ pending: 0, approved: 1, rejected: 2, canceled: 3 }

  validates :name, format: { with: /\A[A-Z0-9]+\z/, message: :uppercaseonly }, presence: true
  validates :description, presence: true
  # validates_datetime :complete_time, :after => :start_time 
  scope :order_by_complete_time, -> { order(complete_time: :asc) }
end
