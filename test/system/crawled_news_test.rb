require "application_system_test_case"

class CrawledNewsTest < ApplicationSystemTestCase
  setup do
    @crawled_news = crawled_news(:one)
  end

  test "visiting the index" do
    visit crawled_news_url
    assert_selector "h1", text: "Crawled News"
  end

  test "creating a Crawled news" do
    visit crawled_news_url
    click_on "New Crawled News"

    fill_in "Body", with: @crawled_news.body
    fill_in "Link", with: @crawled_news.link
    fill_in "Publish date", with: @crawled_news.publish_date
    fill_in "Subtitle", with: @crawled_news.subtitle
    fill_in "Title", with: @crawled_news.title
    fill_in "Url", with: @crawled_news.url
    click_on "Create Crawled news"

    assert_text "Crawled news was successfully created"
    click_on "Back"
  end

  test "updating a Crawled news" do
    visit crawled_news_url
    click_on "Edit", match: :first

    fill_in "Body", with: @crawled_news.body
    fill_in "Link", with: @crawled_news.link
    fill_in "Publish date", with: @crawled_news.publish_date
    fill_in "Subtitle", with: @crawled_news.subtitle
    fill_in "Title", with: @crawled_news.title
    fill_in "Url", with: @crawled_news.url
    click_on "Update Crawled news"

    assert_text "Crawled news was successfully updated"
    click_on "Back"
  end

  test "destroying a Crawled news" do
    visit crawled_news_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crawled news was successfully destroyed"
  end
end
