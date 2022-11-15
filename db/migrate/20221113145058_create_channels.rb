class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :group, default: 0

      t.timestamps
    end
  end
end
