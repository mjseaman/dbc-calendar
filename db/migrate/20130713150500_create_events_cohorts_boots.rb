require_relative '../config'

class CreateEventsCohortsBoots < ActiveRecord::Migration
	def change
		create_table :boots do |t|
			t.belongs_to :cohort
			t.string :first_name
			t.string :last_name
			t.string :email
			t.string :cohort
			t.timestamps
		end

		create_table :cohorts do |t|
			t.date :start_date
			t.date :graduation_date
			t.string :last_name
			t.timestamps
		end

		create_table :events do |t|
			t.string :name
			t.datetime :start_time
			t.datetime :end_time
			t.string :cohorts
			t.timestamps
		end

		create_table :cohorts_events do |t|
			t.belongs_to :cohort
			t.belongs_to :event
			t.timestamps
		end
	end
end