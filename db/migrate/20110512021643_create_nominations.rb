class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations do |t|
      t.string :nominee_firstname
      t.string :nominee_lastname
      t.string :nominee_department
      t.string :nominator_firstname
      t.string :nominator_lastname
      t.string :nominator_email
      t.string :token
      t.timestamps
    end
    add_index :nominations, :token,                :unique => true
  end

  def self.down
    drop_table :nominations
  end
end
