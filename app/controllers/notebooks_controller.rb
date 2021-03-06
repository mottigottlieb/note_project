
class NotebooksController < ApplicationController


	before_action :find_notebook, only: [:show, :edit, :update, :destroy]

	def index
		@notebooks = Notebook.all
		binding.pry
		@notebook = Notebook.find_by(params[:id])

	end

	def show
	  @notebook = Notebook.find(params[:id])
	end


	def new
		@notebook = Notebook.new
		@notebooks = Notebook.all
	end

	def create
		@notebook = Notebook.create(notebook_params)
		if @notebook.valid?
			@notebook.save
			redirect_to notebooks_path(@notebooks)
		else
			render :new
		end
	end	

	def edit
		@notebook = Notebook.find_by(params[:id])
	end

	def update
	end

	def destroy
		@notebook.destroy
		redirect_to notebooks_path
	end

	

	def find_notebook
		@notebook = Notebook.find_by(params[:id])
	end	
end



