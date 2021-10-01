require 'test_helper'

class CrawledNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crawled_news = crawled_news(:one)
  end

  test "should get index" do
    get crawled_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_crawled_news_url
    assert_response :success
  end

  test "should create crawled_news" do
    assert_difference('CrawledNews.count') do
      post crawled_news_index_url, params: { crawled_news: { body: @crawled_news.body, link: @crawled_news.link, publish_date: @crawled_news.publish_date, subtitle: @crawled_news.subtitle, title: @crawled_news.title, url: @crawled_news.url } }
    end

    assert_redirected_to crawled_news_url(CrawledNews.last)
  end

  test "should show crawled_news" do
    get crawled_news_url(@crawled_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_crawled_news_url(@crawled_news)
    assert_response :success
  end

  test "should update crawled_news" do
    patch crawled_news_url(@crawled_news), params: { crawled_news: { body: @crawled_news.body, link: @crawled_news.link, publish_date: @crawled_news.publish_date, subtitle: @crawled_news.subtitle, title: @crawled_news.title, url: @crawled_news.url } }
    assert_redirected_to crawled_news_url(@crawled_news)
  end

  test "should destroy crawled_news" do
    assert_difference('CrawledNews.count', -1) do
      delete crawled_news_url(@crawled_news)
    end

    assert_redirected_to crawled_news_index_url
  end
end
