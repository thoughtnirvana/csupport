module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController

    # GET /resource/sign_in
    def new
      byebug
      data = super
      data
    end
  end
end