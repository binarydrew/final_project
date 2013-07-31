class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :language
  has_many :phrases
  has_many :votes
  has_many :translations

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email



end
