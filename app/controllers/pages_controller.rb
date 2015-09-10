class PagesController < ApplicationController
  def home
  	@last_notes = Note.where(share: true).order(created_at: :desc)
  end
end
