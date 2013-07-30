class Translation < ActiveRecord::Base
  belongs_to :user
  belongs_to :phrase
  has_many :votes
end
