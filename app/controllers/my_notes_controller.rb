class MyNotesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@my_notes = Note.where(user: current_user)
  end
end
