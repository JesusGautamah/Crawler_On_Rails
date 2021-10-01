class CrawledNews < ApplicationRecord
    validates :title, presence: true
    validates :publish_date, presence: true
    validates :subtitle, presence: true
    validates :body, presence: true
    validates :link, presence: true
    validates :url, presence: true
    validates_with PublishDateValidator
end
