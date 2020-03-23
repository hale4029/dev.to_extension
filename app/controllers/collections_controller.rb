class CollectionsController < ApplicationController
  def index
    @collections = Container.where(user_id: session_current_user_id)
  end

  def show
    @collection = Container.find(params[:id])
  end
end
