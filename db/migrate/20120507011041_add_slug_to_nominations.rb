class AddSlugToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :slug, :string
  end
end
