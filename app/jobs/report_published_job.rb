class ReportPublishedJob
  include Sidekiq::Job
  
  def perform(report_id)
    report = Report.find(report_id)
    
    log_message = "[NOTIFY] '#{report.title}' published by #{report.user.email} at #{Time.current.strftime('%Y-%m-%d')}"
    
    # Log to Rails logger
    Rails.logger.info(log_message)
    
    # Log to file
    log_to_file(log_message)
  end
  
  private
  
  def log_to_file(message)
    log_file = Rails.root.join('log', 'report_notifications.log')
    File.open(log_file, 'a') do |file|
      file.puts "#{Time.current.iso8601}: #{message}"
    end
  end
end
