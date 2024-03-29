class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    def should_generate_new_friendly_id?
        title_changed?
    end

    validates_presence_of :about, :title
end
