class Bug < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  enum status: [:open, :closed, :monitor]
  enum issue_type: [:issue, :enhancment, :feature]
  enum priority: [:low, :medium, :high]
end
