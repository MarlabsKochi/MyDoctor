class AddColumnToDoctor < ActiveRecord::Migration
  def change
  	add_column :doctors, :state, :string
  	add_column :doctors, :city, :string
  end
end
