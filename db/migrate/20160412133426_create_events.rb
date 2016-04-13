class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, default: 'New Event'
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
