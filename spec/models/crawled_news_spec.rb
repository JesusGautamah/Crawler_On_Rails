require 'rails_helper'

RSpec.describe CrawledNews, type: :model do
  context 'validations' do

    it "ensures the presence of title" do
      news = CrawledNews.new(title: "").save
      expect(news).to eq(false)
    end

    it "ensures the presence of publish_date" do
      news = CrawledNews.new(publish_date: "").save
      expect(news).to eq(false)
    end

    it "ensures the presence of subtitle" do
      news = CrawledNews.new(subtitle: "").save
      expect(news).to eq(false)
    end

    it "ensures the presence of body" do
      news = CrawledNews.new(body: "").save
      expect(news).to eq(false)
    end
    
    it "ensures the presence of link" do
      news = CrawledNews.new(link: "").save
      expect(news).to eq(false)
    end
    it "ensures the presence of url" do
      news = CrawledNews.new(url: "").save
      expect(news).to eq(false)
    end
  end
end
