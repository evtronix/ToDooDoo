class ListsController < ApplicationController

	respond_to :html, :xml, :js

	def index
		@lists = List.all
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(params[:list])
		if @list.save
			flash[:success] = "List created!"
			redirect_to list_path(@list)
		else
			flash[:error] = "Shit, could not create list"
			redirect_to new_list_path
		end
	end

	def show
		@list = List.find(params[:id])
		
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:success] = "List updated."
			redirect_to list_path(@list)
		else
			flash[:error] = "List did not update :("
			redirect_to edit_list_path(@list)
		end
	end

	def destroy
		@list = List.find(params[:id])
		if @list.destroy
			flash[:success] = "List deleted!"
			redirect_to lists_path
		else
			flash[:error] = "Could not delete."
			redirect_to lists_path
		end
	end
end
