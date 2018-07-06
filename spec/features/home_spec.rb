require 'rails_helper'

feature "visiting the homepage" do |variable|
  scenario "the visitor sees welcome text" do
    visit root_path
    expect(page).to have_text("Padres VBS Colombia")
  end
end