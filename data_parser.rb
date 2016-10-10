require 'csv'
require 'erb'
# CSV.foreach("planet_express_logs.csv", headers: true, :header_converters => :symbol) do |row|

class Delivery
attr_accessor :destination, :money, :shipment, :pilot, :crates

  def initialize (row)
      @destination = row[:destination]
      @money = row[:money].to_i
      @shipment = row[:shipment]
      @crates = row[:crates]
    end

def pilot
  if destination == "Earth"
    @pilot = "Fry"
  elsif destination == "Mars"
      @pilot = "Amy"
  elsif destination == "Uranus"
      @pilot = "Bender"
  else
    @pilot= "Leela"
  end
end
end

fff=[]
# replace with your logic
CSV.foreach("planet_express_logs.csv", headers: true, header_converters: :symbol) do |row|
    fff<< Delivery.new(row)
end

# puts fff.inspect

fff.each do |delivery|
    puts delivery.pilot
end
pilot=fff.group_by{|delivery| delivery.pilot}
    puts pilot
    pilot.each do |key,value|
    puts value.length
puts key.inspect
# puts value.inspect
    ggg=value.reduce(0) {|sum,value| sum + value.money}/10.0
      puts ggg
    ddd=value.reduce(0) {|sum,value| sum + value.money}*10
      puts ddd
end

# group_by_pilot.each do |pilot, trips|
#   puts trips.length
#   trips.reduce(0) {|sum, value| sum + value.money}/10.0
#   puts trips
# end

money = fff.reduce(0){|sum, delivery| sum + delivery.money}
  puts money
#money is total money made by planet exress. #
# fry=fff.select {|fff|fff.pilot == "Fry"}
# puts fry.length

new_file = File.open("./report.html", "w+")
new_file << ERB.new(File.read("report.erb")).result(binding)
new_file.close
