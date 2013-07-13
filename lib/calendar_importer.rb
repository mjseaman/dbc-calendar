require 'date'

require_relative '../app/models/boot'
require_relative '../app/models/cohort'
require_relative '../app/models/event'
# class Schedule
# end

require 'csv'

class CalendarImporter

	def self.import
		import_cohorts
		import_boots
		import_events
	end

	private

	def self.csv_loader(csv_file)
	  hashes = []
	  CSV.foreach(csv_file, :headers => true, :converters => [:date_time], :header_converters => :symbol) do |row|
	    hashes << row.to_hash
	  end
	  hashes
	end

	def self.import_boots
		csv_loader("#{File.dirname(__FILE__)}/../db/data/boots.csv").each do |row|
			row[:cohort] = Cohort.where("name = ?",row[:cohort]).first
			Boot.new(row).save!
		end
	end

	def self.import_cohorts
		csv_loader("#{File.dirname(__FILE__)}/../db/data/cohorts.csv").each do |row|
			Cohort.new(row).save!
		end
	end

	def self.import_events
		csv_loader("#{File.dirname(__FILE__)}/../db/data/events.csv").each do |row|
			cohort_objects = []
			row[:cohorts].split(',').each do |cohort_name|
				cohort_objects << Cohort.where("name = ?",cohort_name).first
			end
			row[:cohorts] = cohort_objects
			Event.new(row).save!
		end
	end
end