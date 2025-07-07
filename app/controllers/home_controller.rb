class HomeController < ApplicationController
  def index
    @recent_reports = current_user.admin? ? 
      Report.published.recent.limit(5) : 
      current_user.reports.recent.limit(5)
  end
end
