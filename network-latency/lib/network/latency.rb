require "bundler/setup"
require "network/latency/version"
require 'timescale'
require 'net/ping/tcp'
require "benchmark"

module Network
  module Latency
    class Error < StandardError; end

    # Ping model to persist latency
    class Ping < ActiveRecord::Base
      acts_as_hypertable time_column: "t"
      scope :stats, -> () { select("min(t) as start, max(t) as end, avg(ms) as average, min(ms) as min, max(ms) as max") }

      def self.setup uri=ENV['PG_URI'], recreate: false
        uri += "?pool=10" unless uri.include?("pool")
        establish_connection(uri)

        connection.instance_exec do
          if Ping.table_exists?
            if recreate
              drop_table(Ping.table_name)
            else
              return
            end
          end

          hypertable_options = {
            time_column: 't',
            chunk_time_interval: '1 day',
            compress_segmentby: 'host',
            compress_orderby: 't',
            compression_interval: '3 days'
          }

          create_table(Ping.table_name, id: false, hypertable: hypertable_options) do |t|
            t.timestamp :t, null: false
            t.decimal :ms, precision: 8, scale: 4
            t.string :host, null: false, default: 'localhost'
            t.index [:t, :host], unique: true
          end
        end
      end
    end
    module_function

    # Measure time to ping address
    def measure(address="localhost")
      Benchmark.measure { ping }.real
    end

    # Ping specific address. Default is localhost
    def ping(address="localhost")
      Net::Ping::TCP.new(address).ping
    end

    def track(address="localhost")
      Ping.create(ms: measure(address), host: address, t: Time.now)
    end
  end
end
