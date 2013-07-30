# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



language = Language.create(lang_name: "English")
language2 = Language.create(lang_name: "Chinese")

user = User.create(first_name: "Andrew", last_name: "Li", language_id: language.id, username: "Ali", email: "test@test.com")
user2 = User.create(first_name: "Ben", last_name: "Liang", language_id: language2.id, username: "BLiang", email: "ben@ben.com")
user3 = User.create(first_name: "Voter", last_name: "Voting", language_id: language2.id, username: "vvv", email: "voter@voter.com")

phrase = Phrase.create(content: "Needs translating", user_id: user.id, posted_lang_id: language.id, trans_lang_id: language2.id)

translation = Translation.create(content: "translated", user_id: user2.id, phrase_id: phrase.id)

vote = Vote.create(vote_value: "10", user_id: user3.id, translation_id: translation.id)



