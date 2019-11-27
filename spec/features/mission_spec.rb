require 'rails_helper'

RSpec.feature "Missions", type: :feature do
  before do
    FactoryBot.create(:user)
  end

  scenario "任務照時間順序排序" do
    FactoryBot.create(:mission, name: "mission001")
    FactoryBot.create(:mission, name: "mission002")
    visit root_path
    within 'tbody tr:nth-child(1)' do
      expect(page).to have_content "mission002"
    end
    within 'tbody tr:nth-child(2)' do
      expect(page).to have_content "mission001"
    end
  end

  scenario "新增任務" do
    visit root_path
    click_on "新增任務"
    fill_in 'mission_name', with: "new_mission"
    select '機密', from: "mission_priority"
    select '已通過', from: "mission_status"
    click_on "確認送出"

    expect(page).to have_content "new_mission"
    expect(page).to have_content "新增任務成功"
  end

  scenario "編輯任務" do
    FactoryBot.create(:mission, name: "origin_name")
    visit root_path
    click_on "編輯"
    fill_in 'mission_name', with: "new_name"
    click_on "確認送出"

    expect(page).to have_content "new_name"
    expect(page).to have_content "更新任務成功"
  end

  scenario "刪除任務" do
    begin
      # put line of code which triggers alert on page
    rescue Selenium::WebDriver::Error::UnhandledAlertError
      @browser.alert.ok 
      FactoryBot.create(:mission, name: "new_mission")
      visit root_path
      click_on "刪除"
      click_on "確認"
      expect(page).not_to have_content "new_mission"
      expect(page).to have_content "任務刪除成功"
    end
  end
end
