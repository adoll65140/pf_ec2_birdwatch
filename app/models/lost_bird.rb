class LostBird < ApplicationRecord
  belongs_to :user
  belongs_to :breed, optional: true
  has_many :lost_bird_comments, dependent: :destroy
  has_many :lost_checks, dependent: :destroy
  has_many :notifications, dependent: :destroy

  attachment :bird_image

  validates :flag, inclusion:{in: [true, false]}
  with_options presence: true do
    validates :lost_bird_name
    validates :lost_bird_introduction
    validates :lost_bird_age
    validates :lost_place
    validates :feature
    validates :lost_introduction
  end

  def checked_by?(user)
    lost_checks.where(user_id: user.id).exists?
  end
  
  def create_notification_lost_bird_comment!(current_user, lost_bird_omment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = LostBirdComment.select(:user_id).where(lost_bird_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_lost_bird_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_lost_bird_comment!(current_user, lost_bird_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_lost_bird_comment!(current_user, lost_bird_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      lost_bird_id: id,
      lost_bird_comment_id: lost_bird_comment_id,
      visited_id: visited_id,
      action: 'lost_bird_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
