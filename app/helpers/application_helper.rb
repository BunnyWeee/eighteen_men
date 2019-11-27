module ApplicationHelper
  
  def restricted_statuses
    statuses.except :rejected, :canceled
  end

end
