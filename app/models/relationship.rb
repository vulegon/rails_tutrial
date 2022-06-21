class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  #class名を入れないと follower_idを探しに行くのでUser
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
