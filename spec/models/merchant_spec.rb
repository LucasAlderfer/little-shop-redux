RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name'
    merchant = Merchant.new

    expect(merchant).to_not be_valid
  end
end
# 12334105,Shopin1901,2010-12-10,2011-12-04
