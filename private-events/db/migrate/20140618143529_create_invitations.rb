class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :attended_event
      t.references :attendee
      t.boolean    :accepted, default: false

      t.timestamps
    end
  end
end
