class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :source
      t.text :source_url
      t.text :url_image
      t.string :author
      t.string :title
      t.text :description
      t.string :published_date

      t.timestamps
    end
  end
end
