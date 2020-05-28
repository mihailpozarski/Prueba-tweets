class AddUserAuthToken < ActiveRecord::Migration[5.2]
  def up
    User.all.each(&:save)
  end

  def down
     raise ActiveRecord::IrreversibleMigration
  end
end
