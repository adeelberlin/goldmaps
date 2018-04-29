class StaticController < ApplicationController
  before_action :authenticate_user!
  def api
  end
end
