class MyNotesController < ApplicationController
  def index
  	@my_notes = Note.where(user: current_user)
  end
end
