require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  context "as a signed in user" do
    scenario "i can create a comment" do
      given_there_is_a_note
      and_i_am_logged_in_as_a_user
      when_i_create_a_comment
      then_the_comment_should_appear_in_the_note
    end
  end

  private

  def given_there_is_a_note
    @note = create(:note, :public)
  end

  def and_i_am_logged_in_as_a_user
    @user = create(:user)

    visit root_path
    click_link("Login")
    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)
    click_button("Log in")
    expect(current_path).to eq(notes_path)
  end

  def when_i_create_a_comment
    click_link(@note.title)
    find("#comment_content").set("comment")
    expect{
      click_button("Publish Comment")
    }.to change(Comment, :count).by(1)
  end

  def then_the_comment_should_appear_in_the_note
    expect(page).to have_current_path(note_path(@note))
    expect(@note.comments.last.content).to eq("comment")
  end
end
