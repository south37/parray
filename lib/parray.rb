require "parallel"

require "parray/api"
require "parray/error"
require "parray/version"

class PArray
  class << self
    DEFAULT_CONCURRENCY = 2

    def parallelize(arr, in_threads: DEFAULT_CONCURRENCY)
      PArray.new(arr, in_threads: in_threads)
    end
  end

  include Enumerable

  def initialize(arr, in_threads:)
    if !arr.respond_to?(:to_a)
      raise Error.new("#{arr} must respond to `#to_a`!")
    end
    @arr        = arr
    @in_threads = in_threads
  end

  def map(&block)
    Parallel.map(@arr.to_a, in_threads: @in_threads) { |*args| yield *args }
  end

  def each(&block)
    Parallel.each(@arr.to_a, in_threads: @in_threads) { |*args| yield *args }
  end

  def to_a
    @arr.to_a
  end
end
