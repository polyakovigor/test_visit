class UsersController < ApplicationController
  def index
    @users = User.order(:name).all
  end

  def import
    format = params[:file].original_filename.split('.').last

    if format == 'csv'
      User.import(params[:file])
      redirect_to users_path, notice: 'Data imported!'
    else
      redirect_to root_url, notice: "Invalid format - #{format}! Must be - CSV!"
    end
  end
end
