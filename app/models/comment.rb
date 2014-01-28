class Comment < ActiveRecord::Base
  attr_accessible :headline, :body
  belongs_to :location

  validates :headline, :body, presence: true

  def self.most_recent_first
    order(:created_at).reverse_order
  end
end