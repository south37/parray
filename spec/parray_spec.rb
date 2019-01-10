require "spec_helper"

describe PArray do
  describe ".parallelize" do
    let(:a) { [1, 2, 3] }

    it "convert an enumerable object to a parallelized array" do
      b = PArray.parallelize(a)

      expect(Parallel).to receive(:map)
      b.map { |i| i * 2 }

      expect(Parallel).to receive(:each)
      b.each { |i| i * 2 }

      expect(b.to_a).to eq a
    end
  end
end
