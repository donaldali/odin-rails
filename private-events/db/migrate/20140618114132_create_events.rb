class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string     :description
      t.date       :date_of
      t.references :creator

      t.timestamps
    end
  end
end
