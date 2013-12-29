class PagesController < ApplicationController

  before_filter :authenticate_user!

  def home
    @user = current_user
    @category = Card.categories
    @object_type = Card.object_types
  end
end
