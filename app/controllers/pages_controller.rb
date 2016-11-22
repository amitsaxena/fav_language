require 'github_api'

class PagesController < ApplicationController
  
  def result
    begin
      return if params[:username].blank?
      @user = GithubApi.find_user(params[:username])
      if @user.blank?
        @suggestions = GithubApi.username_suggestions(params[:username])
      else
        @fav_languages = GithubApi.fav_language(@user)
      end
    rescue Exception => e
      @error = e.message
      Rails.logger.error(e)
      Rails.logger.error(e.backtrace.join("\n"))
      render "error" and return
    end
  end
  
end
