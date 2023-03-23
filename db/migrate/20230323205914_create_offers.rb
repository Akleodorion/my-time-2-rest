class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :job_title
      t.date :start_date
      t.date :end_date
      t.string :status, default: 'pending'
      t.integer :salary
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
