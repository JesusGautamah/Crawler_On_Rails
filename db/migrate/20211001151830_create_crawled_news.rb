class CreateCrawledNews < ActiveRecord::Migration[5.2]
  def change
    create_table :crawled_news do |t|
      t.string :title
      t.date :publish_date
      t.text :subtitle
      t.text :body
      t.string :link
      t.string :url

      t.timestamps
    end
  end
end
