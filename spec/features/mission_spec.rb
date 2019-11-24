require 'rails_helper'

RSpec.feature "Missions", type: :feature do
  # scenario "可以新增一個任務" do
  #   visit '/missions/new'

  #   fill_in 'mission_name', with: 'cccccc002'
  #   select '機密', from: 'mission_priority'
  #   select '已通過', from: 'mission_status'
  #   click_button '確認送出'

  #   expect(page).to have_text('Mission created successfully!!!')
  #   save_and_open_page
  # end


  scenario "任務清單有照時間排序" do
    visit '/missions/new'

    fill_in 'mission_name', with: 'cccccc002'
    select '機密', from: 'mission_priority'
    select '已通過', from: 'mission_status'
    click_button '確認送出'

    visit '/missions/new'

    fill_in 'mission_name', with: 'aaaaaa002'
    select '一般', from: 'mission_priority'
    select '已取消', from: 'mission_status'
    click_button '確認送出'

    expect(Mission.find(2).name).to eq "aaaaaa002"
  end
end
