class Blog < ApplicationRecord
    belongs_to :user
    @total_distance = Blog.all.sum(:distance)
    # validate :content, presence: true
    # validate :distance, presence: true
end
