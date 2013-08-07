class Translation < ActiveRecord::Base
  belongs_to :user
  belongs_to :phrase
  has_many :votes
  belongs_to :parent, class_name: "Translation", foreign_key: "parent_id"
  has_many :children, class_name: "Translation", foreign_key: "parent_id"
end
