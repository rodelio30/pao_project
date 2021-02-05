class PublicController < ApplicationController
  def main
  end
  def user_signed_in?
    current_user ? true : log_in_path 
  end

  private

  def log_in_path
    redirect_to new_user_session_path
  end
end
