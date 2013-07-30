class Phrase < ActiveRecord::Base
  belongs_to :user
  belongs_to :posted_lang, class_name: 'Language', foreign_key: 'posted_lang_id'
  belongs_to :trans_lang, class_name: 'Language', foreign_key: 'trans_lang_id'
  has_many :translations
end
