require_relative '../config'

class RemoveCohortFromBoot < ActiveRecord::Migration
	def self.up
		remove_column :boots, :cohort
	end

	def self.down
		add_column :boots, :cohort, :string
	end
end