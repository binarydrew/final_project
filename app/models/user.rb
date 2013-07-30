class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :language
  has_many :phrases
  has_many :votes
  has_many :trans
end
