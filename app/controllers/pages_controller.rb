require 'github_api'

class PagesController < ApplicationController
  
  def result
    begin
      return if params[:username].blank?
      github = GithubApi.new
      @user = github.find_user(params[:username])
      if @user.blank?
        @suggestions = github.username_suggestions(params[:username])
      else
        @fav_languages = github.fav_language(@user)
      end
    rescue Exception => e
      @error = e.message
      Rails.logger.error(e)
      Rails.logger.error(e.backtrace.join("\n"))
      render "error" and return
    end
  end
  
end
