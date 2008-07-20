class CreatePresences < ActiveRecord::Migration
  def self.up
    create_table :presences do |t|
      t.references :lesson, :null => false
      t.references :student, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :presences
  end
end
