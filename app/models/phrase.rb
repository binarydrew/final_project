class Phrase < ActiveRecord::Base
  belongs_to :user
  belongs_to :posted_lang
  belongs_to :trans_lang
  has_many :translations
end
