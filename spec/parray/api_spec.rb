require "spec_helper"

describe PArray::API do
  describe "#parallelize" do
    let(:a) { [1, 2, 3] }

    it "calls Engine.parallelize in instance methods" do
      expect(PArray).to receive(:parallelize).with(a)
      A.new.m(a)
    end

    it "calls Engine.parallelize in class methods" do
      expect(PArray).to receive(:parallelize).with(a)
      A.m2(a)
    end

    class A
      include PArray::API

      def m(a)
        parallelize(a)
      end

      class << self
        def m2(a)
          parallelize(a)
        end
      end
    end
  end
end
