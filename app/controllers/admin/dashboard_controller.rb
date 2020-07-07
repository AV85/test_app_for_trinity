class Admin::DashboardController < ApplicationController
  def index
    @authors = Author.all
  end
end
