require 'rails_helper'

RSpec.feature "Notes", type: :feature do
  let(:user) { create(:user) }
  let(:note) { build(:note) }

  context "as a signed in user" do
    scenario "i can create a note" do
      given_i_am_logged_in_as_a_user
      and_after_creating_a_note
      then_the_note_should_appear_in_my_notes
    end

    scenario "i can update a note" do
      given_i_am_logged_in_as_a_user
      and_after_creating_a_note
      and_a_note_belongs_to_me
      i_go_to_my_notes
      and_update_the_note
      then_the_note_name_is_updated
    end

    scenario "i can delete my note", js: true do
      given_i_am_logged_in_as_a_user
      and_after_creating_a_note
      i_can_delete_my_note
    end
  end

  context "when user is not signed in" do
    scenario "user is redirected to home page" do
      visit new_note_path
      expect(current_path).to eq(new_user_session_path)
    end
  end

  private

  def create_note
    expect {
      fill_in("Title", with: note.title)
      fill_in("Content", with: note.content)
      click_button("Create Note")
    }.to change(user.notes, :count).by(1)
  end

  def given_i_am_logged_in_as_a_user
    visit root_path
    click_link"Login"
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
  end

  def and_after_creating_a_note
    visit my_notes_path
    click_link("New Note")
    expect {
      fill_in("Title", with: note.title)
      fill_in("Content", with: note.content)
      click_button("Create Note")
    }.to change(Note, :count).by(1)
  end

  def then_the_note_should_appear_in_my_notes
    expect(current_path).to eq(my_notes_path)
    expect(page).to have_content("My Notes")
    expect(page).to have_content(note.title)
  end

  def and_a_note_belongs_to_me
    note.user = user
    expect(note.user).to eq(user)
  end

  def i_go_to_my_notes
    visit my_notes_path
  end

  def and_update_the_note
    note = create(:note, title: "Title")
    visit note_path(note)
    click_link("Edit")
    fill_in("Title", with: "Updated title")
    click_button("Update Note")
  end

  def and_i_am_redirected_to_the_note
    expect(current_path).to eq(note_path(note.id))
  end

  def then_the_note_name_is_updated
    visit my_notes_path
    expect(page).to have_content("Updated title")
  end

  def i_can_delete_my_note
    visit my_notes_path
    click_link(note.title)

    expect {
      accept_alert do
        click_link("Delete")
      end
      sleep 1
    }.to change(Note, :count).by(-1)
  end

end
