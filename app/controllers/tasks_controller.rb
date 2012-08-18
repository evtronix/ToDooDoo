class TasksController < ApplicationController
	attr_accessor :completed
	before_filter :find_list
	respond_to :html, :xml, :js

	def create
		@task = @list.tasks.new(params[:task])
		if @task.save
			flash[:success] = "Woohoo! Task Created!"
			redirect_to list_path(@list)
		else
			flash[:error] = "Shit, could not create task!"
			redirect_to list_path(@list)
		end
	end

	def complete
		@task = @list.tasks.find(params[:id])
		@task.completed = true
		@task.save
		redirect_to list_path(@list)
	end

	private

	def find_list
		@list = List.find(params[:list_id])
	end
end
