class UserController < ApplicationController
  def status
  	st = User.get_status(params[:id])
  	respond_to do |format|           
      format.json { render :json => {:status => st} }
    end
  end
  def index
  	users = User.all
  	respond_to do |format|           
      format.json { render :json => users , :only => [:id, :username, :masinhvien]  }
    end
  end
end
