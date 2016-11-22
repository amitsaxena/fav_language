class GithubApi
  
  def self.find_user(username)
    begin
      Octokit.user(username)
    rescue Octokit::NotFound
    end
  end
  
  def self.username_suggestions(username)
    begin
      users = Octokit.search_users(username)
      return users[:items][0..4]
    rescue
    end
  end
  
  def self.fav_language(user)
    Octokit.auto_paginate = true
    repos = user.rels[:repos].get(:type => :all).data
    return nil if repos.blank?
    
    language_data = repos.map{|repo| Octokit.languages(:owner => repo[:owner][:login], :repo => repo[:name])}
    language_sum = {}
    language_data.each do |data|
      data.each do |lang, bytes|
        language_sum[lang] = (language_sum[lang] || 0) + bytes
      end
    end
    fav_languages = language_sum.sort_by{|k, v| v}.reverse[0..4].map{|a| a[0].to_s}
    return fav_languages
  end
  
end
