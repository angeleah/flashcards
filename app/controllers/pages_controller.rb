class PagesController < ApplicationController

  before_filter :authenticate_user!

  def home
    @user = current_user
    @object_type = Card.object_types
  end
end
