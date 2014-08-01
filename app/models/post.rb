class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  has_many :votes

  

  default_scope { order('rank DESC') }
  #scope :ordered_by_created_at, -> { order('created_at ASC') }
  #scope :order_by_title, -> { order('title') }
  #scope :for_user, -> (user) { |user| where(user_id: user.id) }  #Post.for_user(current_user)

  # scope :private, -> { where(private: true) }

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   


   mount_uploader :image, ImageUploader

  def up_votes
     votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  def update_rank
     age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age
 
     update_attribute(:rank, new_rank)
   end

 private

  # Who ever created a post, should automatically be set to "voting" it up.
  def create_vote
    user.votes.create(value: 1, post: self)
  end
  
end
