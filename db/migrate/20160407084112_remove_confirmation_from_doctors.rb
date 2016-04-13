class RemoveConfirmationFromDoctors < ActiveRecord::Migration
  def change
  	remove_column :doctors, :confirmation_token, :string
  	remove_column :doctors, :confirmed_at, :datetime
  	remove_column :doctors, :confirmation_sent_at, :datetime
  	remove_column :doctors, :unconfirmed_email, :string
  end
end
