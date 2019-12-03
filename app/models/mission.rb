class Mission < ApplicationRecord
  # belongs_to :user
  
  enum priority:{ important: 0, normal: 1 }
  enum status:{ pending: 0, approved: 1, rejected: 2, canceled: 3 }

  validates :name, format: { with: /\A[A-Z0-9]+\z/, message: "請注意英文只能使用大寫！" }, presence: true
  validates :description, presence: true
  validates_datetime :complete_time, :after => :start_time 
end
