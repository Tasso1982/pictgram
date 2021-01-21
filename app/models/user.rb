class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  
  # https://qiita.com/jnchito/items/893c887fbf19e17d3ff9
  # http://emailregex.com/ は上手くいかなかった・・・
  # 結局、シンプルに　https://qiita.com/shumpeism/items/d299aaeb34e1d741e82b
  Valid_Email_Regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: Valid_Email_Regex }
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  has_secure_password
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }, format: { with: VALID_PASSWORD_REGEX }
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
end
