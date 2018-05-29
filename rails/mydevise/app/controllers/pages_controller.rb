class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def index
  	#debugger
  end

  def new
  end

  def secret
  end
end
