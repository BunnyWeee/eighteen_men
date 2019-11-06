require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe "新增活動" do
    it "任務名稱欄位必填" do
      mission = Mission.new
      expect(mission).not_to be_valid
    end
  end
end
