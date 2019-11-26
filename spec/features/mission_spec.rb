require 'rails_helper'

RSpec.feature "Missions", type: :feature do
  before do
    FactoryBot.create(:user)
  end

  scenario "新增任務" do
    visit root_path
    click_on "新增任務"
    fill_in 'mission_name', with: "cccccc002"
    select '機密', from: "mission_priority"
    select '已通過', from: "mission_status"
    click_on "確認送出"

    expect(page).to have_content "cccccc002"
    expect(page).to have_content "新增任務成功"
  end

  scenario "編輯任務" do
    FactoryBot.create(:mission, name: "cccccc002")
    visit root_path
    click_on "編輯"
    fill_in 'mission_name', with: "aaaaaa002"
    click_on "確認送出"

    expect(page).to have_content "aaaaaa002"
    expect(page).to have_content "更新任務成功"
  end

  scenario "刪除任務" do
    begin
      # put line of code which triggers alert on page
    rescue Selenium::WebDriver::Error::UnhandledAlertError
      @browser.alert.ok 
      FactoryBot.create(:mission, name: "cccccc002")
      visit root_path
      click_on "刪除"
      click_on "確認"
      expect(page).not_to have_content "cccccc002"
      expect(page).to have_content "任務刪除成功"
    end
  end
end
