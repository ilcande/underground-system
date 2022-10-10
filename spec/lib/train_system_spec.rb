# frozen_string_literal: true

require './lib/underground_system'

RSpec.describe UndergroundSystem do # rubocop:disable Metrics/BlockLength
  let(:underground_system) { UndergroundSystem.new }

  describe '#check_in' do
    it 'stores the customer id and the station name and time' do
      underground_system.check_in(45, 'Leyton', 3)
      expect(underground_system.instance_variable_get(:@customers)).to eq({ 45 => ['Leyton', 3] })
    end
  end

  describe '#check_out' do
    it 'stores the travel time' do
      underground_system.check_in(45, 'Leyton', 3)
      underground_system.check_out(45, 'Paradise', 8)
      expect(underground_system.instance_variable_get(:@travel_times)).to eq({ %w[Leyton Paradise] => [5] })
    end
  end

  describe '#get_average_time' do
    it 'returns the average time' do
      underground_system.check_in(45, 'Leyton', 3)
      underground_system.check_in(32, 'Paradise', 8)
      underground_system.check_out(45, 'Waterloo', 15)
      underground_system.check_out(32, 'Cambridge', 22)
      expect(underground_system.get_average_time('Leyton', 'Waterloo')).to eq(12.0)
    end

    it 'returns the average time for example 1' do
      underground_system.check_in(45, 'Leyton', 3)
      underground_system.check_in(32, 'Paradise', 8)
      underground_system.check_in(27, 'Leyton', 10)
      underground_system.check_out(45, 'Waterloo', 15)
      underground_system.check_out(27, 'Waterloo', 20)
      underground_system.check_out(32, 'Cambridge', 22)

      expect(underground_system.get_average_time('Paradise', 'Cambridge')).to eq(14.0)
      expect(underground_system.get_average_time('Leyton', 'Waterloo')).to eq(11.0)

      underground_system.check_in(10, 'Leyton', 24)
      underground_system.check_out(10, 'Waterloo', 38)

      expect(underground_system.get_average_time('Leyton', 'Waterloo')).to eq(12.0)
    end
  end
end
