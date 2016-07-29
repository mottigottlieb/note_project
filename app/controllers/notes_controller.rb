class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :destroy, :update]


	def index
		@notes = Note.where(user_id: current_user)
	end

	def show
		@notebooks = Notebook.all
		@note = Note.find_by(params[:id])
		@notebook = Notebook.find_by(params[:id])
		@notes = @notebook.notes.all
		
	end

	def new

		@notebook = Notebook.find_by(params[:id])
		@notebooks = Notebook.all
		@note = @notebook.notes.build
		@notes = @notebook.notes.all
		
		

	end

	def create
<<<<<<< HEAD
		binding.pry
		#@notebooks = Notebook.all
		@notebook = Notebook.find_by(params[:notebook_id])
		#@notes = @notebook.notes.all
		@note = @notebook.notes.build(note_params)
=======

		@notebooks = Notebook.all
		@notebook = Notebook.find_by(params[:id])
		# @notebook = Notebook.find_by(params[:notebook_id])
		@notes = @notebook.notes.all
		@note = @notebook.notes.build(note_params)#(notebook_note_path[:notebook_id])
>>>>>>> 7d7463441de269ec5350e01b3bf568b038f93b70
		if @note.save
			redirect_to notebook_note_path(@note)
		else
			render :new
		end
	end

	

	def edit
		@notebooks = Notebook.all
	end

	def update
		if @note.update(note_params)
			redirect_to note_path
		else
			render 'edit'
		end
	end

	def destroy
		if @note.destroy
			redirect_to notebook_path
		else
			render :show
		end
	end

	private

	def find_note
		@note = Note.find_by_id(params[:id])

	end

	def note_params
		params.require(:note).permit(:title, :content, :notebook_id)
	end


end
