class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :body, length: { minimum: 5, maximum: 1000 }, presence: true
  validates :user, presence: true
end
