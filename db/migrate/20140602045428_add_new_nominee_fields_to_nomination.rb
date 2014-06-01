class AddNewNomineeFieldsToNomination < ActiveRecord::Migration
  def change
    add_column :nominations, :nominee_ucsd_address, :string
    add_column :nominations, :nominee_ucsd_city, :string
    add_column :nominations, :nominee_ucsd_state, :string
    add_column :nominations, :nominee_ucsd_zip, :string
    add_column :nominations, :nominee_ucsd_email, :string
    add_column :nominations, :nominee_ucsd_phone, :string
    add_column :nominations, :nominee_address, :string
    add_column :nominations, :nominee_city, :string
    add_column :nominations, :nominee_state, :string
    add_column :nominations, :nominee_zip, :string
    add_column :nominations, :nominee_email, :string
    add_column :nominations, :nominee_phone, :string
  end
end
