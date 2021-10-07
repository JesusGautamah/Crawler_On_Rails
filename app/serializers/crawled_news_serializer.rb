class CrawledNewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :body, :publish_date, :created_at
end
