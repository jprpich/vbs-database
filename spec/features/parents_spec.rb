require 'rails_helper'

feature "signing in and then creating a parent" do 
  let(:hacker) {FactoryGirl.create(:hacker, role_type: 1)}
  let(:parent) {FactoryGirl.create(:parent)}
  
  def fill_in_signin_fields
    fill_in "hacker[email]", with: hacker.email
    fill_in "hacker[password]", with: hacker.password
    click_button "Log in"
  end

  def create_parent
    fill_in "parent[first_name]", with: parent.first_name
    fill_in "parent[last_name]", with: parent.last_name
    fill_in "parent[email]", with: parent.email
    fill_in "parent[phone]", with: parent.phone
    fill_in "parent[church]", with: parent.church
    fill_in "parent[amount_paid]", with: parent.amount_paid
    click_button "Create Parent"
  end

  scenario "create a parent" do 
    visit root_path
    click_link "Login"
    fill_in_signin_fields
    click_link "Crear Padre"
    create_parent
    expect(page).to have_text("Padre creado con éxito")
  end
end

