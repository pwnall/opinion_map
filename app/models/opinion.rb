class Opinion < ActiveRecord::Base
  belongs_to :issue
  
  validates :name, uniqueness: { scope: [:issue_id],
      message: 'You can only vote once on each issue' },
      format: { with: /^[A-Za-z ]+$/ }
end
