RSpec.describe Network::Latency do
  it "has a version number" do
    expect(Network::Latency::VERSION).not_to be nil
  end

  it "measures latency" do
    expect(described_class.measure).to be_kind_of(Numeric)
  end
end
