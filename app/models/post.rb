class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }
  #scope :ordered_by_created_at, -> { order('created_at ASC') }
  #scope :order_by_title, -> { order('title') }
  #scope :for_user, -> (user) { |user| where(user_id: user.id) }  #Post.for_user(current_user)

  # scope :private, -> { where(private: true) }

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :user, presence: true

end
