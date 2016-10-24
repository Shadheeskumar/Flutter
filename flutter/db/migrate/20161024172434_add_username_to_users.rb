class AddUsernameToUsers < ActiveRecord::Migration
  def change #everything here is translated to sql code and modifies to db now sqlite
    add_column :users, :username, :string #add new column to table users called username and type string
    add_index :users, :username, unique: true #index usernames for quick lookup and ensure usernames are always unique
  end
end
