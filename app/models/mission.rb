class Mission < ApplicationRecord
  # belongs_to :user
  
  enum priority:{ important: 0, normal: 1 }
  enum status:{ pending: 0, approved: 1, rejected: 2, canceled: 3 }

  validates :name, presence: true

  def self.restricted_statuses
    statuses.except :rejected, :canceled
  end

end
