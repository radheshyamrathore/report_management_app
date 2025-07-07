class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:show, :edit, :update, :destroy]
  
  def index
    @reports = filter_reports
    @reports = @reports.page(params[:page]).per(10)
    @categories = Report::CATEGORIES
  end
  
  def show
  end
  
  def new
    @report = current_user.reports.build
  end
  
  def create
    @report = current_user.reports.build(report_params)
    
    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @report.update(report_params)
      redirect_to @report, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @report.destroy
    redirect_to reports_url, notice: 'Report was successfully deleted.'
  end
  
  private
  
  def set_report
    @report = Report.find(params[:id])
  end
  
  def check_owner
    unless current_user.admin? || @report.user == current_user
      redirect_to reports_path, alert: 'Access denied.'
    end
  end
  
  def report_params
    params.require(:report).permit(:title, :description, :category, :status, :published_on, :logo)
  end
  
  def filter_reports
    reports = current_user.admin? ? Report.all : current_user.reports
    reports = reports.by_category(params[:category])
    reports = reports.by_status(params[:status])
    reports.recent
  end
end
