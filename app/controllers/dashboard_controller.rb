class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def index
		#@user = User.all	
		@user=User.paginate(:page => params[:page], :per_page => 30)
		if params[:search]
  		  @users = User.search(params[:search]).order("created_at DESC")
  		else
  		  @users = User.all.order('created_at DESC')
 	    end
	end
end
