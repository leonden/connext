class PagesController < ApplicationController
  # index is a public page
  def index
  end

  def profile
    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
    end
  end
end