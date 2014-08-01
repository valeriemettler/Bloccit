class Vote < ActiveRecord::Base
   
  belongs_to :user
  belongs_to :post, dependent: :destroy 

  default_scope { order('created_at DESC') }

  validates :user, presence: true
  validates :post, presence: true
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

  private

  def update_post
    post.update_rank
  end

end


