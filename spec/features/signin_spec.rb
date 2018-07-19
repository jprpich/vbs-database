require 'rails_helper'

feature "visiting the parents page without signing in" do |variable|
  scenario "the visitor sees not so welcoming text" do
    visit parents_path
    expect(page).to have_text("You need to sign in or sign up before continuing.")
  end
end

feature "signing in" do 
  let(:hacker) {FactoryGirl.create(:hacker, role_type: 1)}
  let(:parent) {FactoryGirl.create(:parent)}
  def fill_in_signin_fields
    fill_in "hacker[email]", with: hacker.email
    fill_in "hacker[password]", with: hacker.password
    click_button "Log in"
  end

  scenario "visiting the site to sign in" do 
    visit root_path
    click_link "Login"
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully.")
    visit parents_path
    expect(page).to have_text("Padres VBS Colombia")
    visit children_path
    expect(page).to have_text("Niños VBS Colombia")
  end
end

