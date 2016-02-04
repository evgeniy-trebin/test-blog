class CreateProfiles < ActiveRecord::Migration

  class User < ActiveRecord::Base
    has_one :profile
  end

  class Profile < ActiveRecord::Base
    belongs_to :user
  end


  def change
    create_table :profiles do |t|
      t.references :user, index: true, null: false, unique: true
      t.string :name
      t.string :surname
      t.text :avatar
      t.text :status_text

      t.timestamps null: false
    end

    add_foreign_key :profiles, :users

  end
end
