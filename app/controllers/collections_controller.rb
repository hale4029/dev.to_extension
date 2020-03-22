class CollectionsController < ApplicationController
  def index
    #@resources = Collection.all.paginate(10, params[:page])
    @resources = Collection.where(user_id: session_current_user_id)
    #require "pry"; binding.pry
  end

  # Define a custom finder by overriding the `find_resource` method:
  # def find_resource(param)
  #   Collection.find_by!(slug: param)
  # end
end
