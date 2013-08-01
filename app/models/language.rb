class Language < ActiveRecord::Base
	has_many :users
	has_many :original_phrases, class_name: 'Phrase', foreign_key: 'posted_lang_id'
	has_many :trans_phrases, class_name: 'Phrase', foreign_key: 'trans_lang_id'

	

end
