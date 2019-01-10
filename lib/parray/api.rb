class PArray
  module API
    class << self
      def included(klass)
        klass.extend self
      end
    end

    def parallelize(*args)
      PArray.parallelize(*args)
    end
  end
end
