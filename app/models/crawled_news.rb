class CrawledNews < ApplicationRecord
    validates :title, presence: true
    validates :publish_date, presence: true
    validates :subtitle, presence: true
    validates :body, presence: true
    validates :link, presence: true
    validates :url, presence: true
    validates_with PublishDateValidator
    include PgSearch::Model
    
    pg_search_scope :search_news, against: %i[title body], using: { tsearch: { dictionary: 'portuguese' } }

    scope :search_like, -> (field_name, search_string) {where("#{field_name} LIKE ?", "%#{search_string}%")}
    scope :search_end, -> (field_name, search_string) {where("#{field_name} <= ?", "%#{search_string}%")}
    scope :search_start, -> (field_name, search_string) {where("#{field_name} >= ?", "%#{search_string}%")}
    scope :search_between, -> (field_name, starts, ends) {where("#{field_name} BETWEEN ? AND ?", "#{starts}","#{ends}")}

    
end
