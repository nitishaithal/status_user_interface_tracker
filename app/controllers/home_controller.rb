class HomeController < ApplicationController
	def index
		if user_signed_in?
			redirect_to :controller =>'dashboard', :action => 'new'
		else
			redirect_to :controller =>'devise/sessions', :action => 'new'
		end
	end
	def new
		@user=User.all
	end

	def edit
		if user_signed_in?
			redirect_to :controller =>'devise/registrations', :action => 'edit'
		end
	end
end
