class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :discogs_user
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :password_digest
      t.string :email
      t.string :wax_username

      t.timestamps
    end
  end
end
