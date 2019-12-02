require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe "新增任務" do
    it "新增任務" do
      mission = Mission.new
      expect(mission).to be_a Mission
    end
  end

  describe "新增標準任務" do
    it "添加任務名稱及任務內容" do
      mission = Mission.new
      mission.name = "new_mission"
      mission.description = "description_test_here"
      expect(mission.name).to eq "new_mission"
      expect(mission.description).to eq "description_test_here"
    end
  end

  describe "新增非標準任務" do
    it "僅添加任務名稱" do
      # mission = Mission.new
      # mission.name = "new_mission"
      mission = Mission.create(name: "NEWMISSION", description: "")
      expect(mission.errors.full_messages).to eq ["Description 不能為空白"]
    end
  end
end
