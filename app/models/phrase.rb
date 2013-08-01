class Phrase < ActiveRecord::Base
  belongs_to :user
  belongs_to :posted_lang, class_name: 'Language', foreign_key: 'posted_lang_id'
  belongs_to :trans_lang, class_name: 'Language', foreign_key: 'trans_lang_id'
  has_many :translations

  validates_presence_of :content

  validate :sentence_translate_not_same

	def sentence_translate_not_same
		errors.add(:trans_lang, "can't be the same as email") if posted_lang == trans_lang
	end
end

