# frozen_string_literal: true

# class which keeps track of customer travel times between different stations
class UndergroundSystem
  def initialize
    @travel_times = Hash.new { |h, k| h[k] = [] }
    @customers = Hash.new { |h, k| h[k] = [] }
  end

  def check_in(id, station_name, time)
    @customers[id] = [station_name, time]
  end

  def check_out(id, station_name, time)
    start_station, start_time = @customers[id]
    @travel_times[[start_station, station_name]] << time - start_time
  end

  def get_average_time(start_station, end_station)
    @travel_times[[start_station, end_station]].sum / @travel_times[[start_station, end_station]].size.to_f
  end
end

underground_system = UndergroundSystem.new

underground_system.check_in(45, 'Leyton', 3)
underground_system.check_in(32, 'Paradise', 8)
underground_system.check_in(27, 'Leyton', 10)
underground_system.check_out(45, 'Waterloo', 15)
underground_system.check_out(27, 'Waterloo', 20)
underground_system.check_out(32, 'Cambridge', 22)

puts underground_system.get_average_time('Paradise', 'Cambridge')
puts underground_system.get_average_time('Leyton', 'Waterloo')

underground_system.check_in(10, 'Leyton', 24)
underground_system.check_out(10, 'Waterloo', 38)

puts underground_system.get_average_time('Leyton', 'Waterloo')
