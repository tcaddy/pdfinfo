RSpec.describe Pdfinfo::TrimPage do
  let(:page_string) { "0.00     0.00   590.28   840.89" }
  let(:page) { described_class.from_string(page_string) }
  subject { page }

  describe '.from_string' do
    it 'returns an instance of Pdfinfo::TrimPage' do
      expect(subject).to be_instance_of(Pdfinfo::TrimPage)
    end
    it 'parses the string correctly' do
      expect(Pdfinfo::TrimPage).to receive(:new).with('590.28', '840.89')
      subject
    end
  end

  describe '#height' do
    subject { page.height }
    it { is_expected.to eq(840.89) }
  end

  describe '#width' do
    subject { page.width }
    it { is_expected.to eq(590.28) }
  end

  describe "#to_hash" do
    it 'returns a hash representation of the object' do
      expect(subject.to_hash).to eq({width: 590.28, height: 840.89, rotation: 0.0})
    end
  end

end