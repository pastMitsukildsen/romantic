class Plan < ApplicationRecord
	belongs_to :user

    attachment :image, destroy: false

    has_many :plan_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end

	validates :title, presence: true, length: {maximum: 50}
	validates :body, presence: true
	validates :image, presence: true
    validates :point, presence: true

end
