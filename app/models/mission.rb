class Mission < ApplicationRecord
  
  enum priority:{ important: 0, normal: 1 }
  enum status:{ pending: 0, approved: 1, rejected: 2, canceled: 3 }
  
  def index
    @mission = Mission.all
  end
end
