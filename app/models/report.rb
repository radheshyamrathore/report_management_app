class Report < ApplicationRecord
  belongs_to :user
  
  # ActiveStorage for file uploads
  has_one_attached :logo
  
  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :status, inclusion: { in: %w[draft published archived] }
  
  # Scopes
  scope :published, -> { where(status: 'published') }
  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :recent, -> { order(created_at: :desc) }
  
  # Enums (alternative approach)
  # enum status: { draft: 'draft', published: 'published', archived: 'archived' }
  enum :status, {
    draft: "draft",
    published: "published",
    archived: "archived"
  }, typed: true
  
  # Constants
  CATEGORIES = ['Technology', 'Business', 'Health', 'Education', 'Finance'].freeze
  
  # Callbacks
  after_update :notify_published, if: :saved_change_to_status?
  
  private
  
  def notify_published
    return unless status == 'published'
    ReportPublishedJob.perform_async(id)
  end
end