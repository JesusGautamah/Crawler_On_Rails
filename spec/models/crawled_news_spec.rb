require 'rails_helper'

RSpec.describe CrawledNews, type: :model do
  context 'validations' do

    it "ensures the presence of title" do
      news = CrawledNews.new(title: "", publish_date: "10/04/2001", subtitle: "sub", body:"some text", link: "a link", url: "a url").save
      expect(news).to eq(false)
    end

    it "ensures the presence of publish_date" do
      news = CrawledNews.new(title: "titulo", subtitle: "sub", body:"some text", link: "a link", url: "a url", publish_date: "").save
      expect(news).to eq(false)
    end

    it "ensures the presence of subtitle" do
      news = CrawledNews.new(title: "titulo", subtitle: "", body:"some text", link: "a link", url: "a url", publish_date: "10/04/2020").save
      expect(news).to eq(false)
    end

    it "ensures the presence of body" do
      news = CrawledNews.new(title: "titulo", subtitle: "sub", body:"", link: "a link", url: "a url", publish_date: "10/04/2020").save
      expect(news).to eq(false)
    end
    
    it "ensures the presence of link" do
      news = CrawledNews.new(title: "titulo", subtitle: "sub", body:"some text", link: "", url: "a url", publish_date: "10/04/2020").save
      expect(news).to eq(false)
    end
    it "ensures the presence of url" do
      news = CrawledNews.new(title: "titulo", subtitle: "sub", body:"some text", link: "a link", url: "", publish_date: "10/04/2020").save
      expect(news).to eq(false)
    end
    it "ensures the publish_date is on present or past" do
      news = CrawledNews.new(title: "titulo", subtitle: "sub", body:"some text", link: "a link", url: "a url", publish_date: "10/04/2023").save
      expect(news).to eq(false)
    end
    it "ensures the CrawledNews is valid" do
      news = CrawledNews.new(title: "titulo", subtitle: "sub", body:"some text", link: "a link", url: "a url", publish_date: "10/04/2020").save
      expect(news).to eq(true)
    end
  end
end
