class ProjectsController < ApplicationController
	def index
		#To loop through all the projects that are available to a particular user
		@projects = current_user.projects
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		#current_user.projects << @project
		UserProject.create(user_id: current_user.id, project_id: @project.id, admin: true)
		respond_to do |format|
		    format.html { redirect_to @project }
		    format.json { render :json => @project.to_json }
  		end
	end

	def show
		#@user = User.find(params[:id])
		@user = User.all
		@project = Project.find(params[:id])
		#UserProject.create(user_id: @user.id, project_id: @project.id, admin: false )
	end

	def edit
	end
	
	private

	def project_params
		params.require(:project).permit(:title, :description)
	end
end
