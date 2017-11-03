class FakePostsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    render json: params.except(:controller, :action, :format).to_json
  end

end
