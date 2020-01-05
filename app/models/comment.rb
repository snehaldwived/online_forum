class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  validates :body, :user_id, presence: true
  validates :body, length: { minimum: 5 }
end
