class Blog < ApplicationRecord
    belongs_to :user
    @total_distance = Blog.all.sum(:distance)
end
