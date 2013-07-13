require 'date'
# class Schedule
# end

require 'csv'
def csv_loader(csv_file)
  hashes = []
  CSV.foreach(csv_file, :headers => true, :converters => [:date_time], :header_converters => :symbol) do |row|
    hashes << row.to_hash
  end
  hashes
end