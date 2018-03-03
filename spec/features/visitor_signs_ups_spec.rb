require 'rails_helper'

RSpec.feature "VisitorSignsUps", type: :feature do
  let(:user) { build(:user) }

  context "with valid email and password" do
    scenario "visitor can create account" do
      visit root_path
      click_link("Register")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: user.password)
        fill_in("Password confirmation", with: user.password)
        click_button("Sign up")
      }.to change(User, :count).by(1)

      expect(current_path).to eq(notes_path)
      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to have_content("Latest Notes")
    end
  end

  context "without email" do
    scenario "visitor cannot create account" do
      visit root_path
      click_link("Register")

      expect {
        fill_in("Email", with: '')
        fill_in("Password", with: user.password)
        fill_in("Password confirmation", with: user.password)
        click_button("Sign up")
      }.to change(User, :count).by(0)

      expect(current_path).to eq("/users")
      expect(page).to have_content("Email can't be blank")
    end
  end

  context "without password" do
    scenario "visitor cannot create account" do
      visit root_path
      click_link("Register")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: '')
        fill_in("Password confirmation", with: user.password)
        click_button("Sign up")
      }.to change(User, :count).by(0)

      expect(current_path).to eq("/users")
      expect(page).to have_content("Password can't be blank")
    end
  end

  context "without password confirmation" do
    scenario "visitor cannot create account" do
      visit root_path
      click_link("Register")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: user.password)
        fill_in("Password confirmation", with: '')
        click_button("Sign up")
      }.to change(User, :count).by(0)

      expect(current_path).to eq("/users")
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
