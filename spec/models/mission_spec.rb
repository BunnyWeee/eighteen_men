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
      mission = FactoryBot.create(:mission)
      expect(mission.name).to eq "NEWMISSION"
      expect(mission.description).to eq "description_test_here"
    end
  end

  describe "新增非標準任務" do
    it "僅添加任務名稱" do
      mission = FactoryBot.build(:mission, description:"")
      mission.valid?
      expect(mission.errors.full_messages).to eq ["Description 不能為空白"]
    end
  end

  describe "新任務狀態為佇列中" do
    it "任務的預設狀態" do
      mission = Mission.create(name:"NEWMISSION", description:"mission_description")
      expect(mission.status).to eq "pending"
    end
  end

  describe "編輯任務狀態" do
    it "從佇列中至已完成" do
      mission = Mission.create(name:"NEWMISSION", description:"mission_description")
      mission.update(status:"approved")
      expect(mission.status).to eq "approved"
    end
  end

  describe "查詢任務" do
    it "可查詢任務" do
      mission = Mission.create(name:"SEARCHMISSION", description:"search_test")
      query = Mission.ransack(description_end:"test")
      expect(query.result.pluck(:description).join).to eq "search_test"
    end
  end

end
