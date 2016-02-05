class CreateArticles < ActiveRecord::Migration

  class Article < ActiveRecord::Base
    belongs_to :user

    STATUS_NEW = :new
  end

  class User < ActiveRecord::Base
    has_many :articles
  end

  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :title
      t.text :announce
      t.text :content
      t.timestamp :published_at, index: true
      t.boolean :is_published, default: false, null: false, index: true
      t.string :status, default: Article::STATUS_NEW, index: true
      t.timestamps null: false, index: true
    end

    add_index :articles, [:user_id, :status], name: 'index_by_user_id_status'
    add_index :articles, [:user_id, :status, :is_published, :published_at], name: 'index_by_all'
  end
end
