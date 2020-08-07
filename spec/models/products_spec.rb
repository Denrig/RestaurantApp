RSpec.describe Product, type: :model do
  before do
    @product = Product.new(title: 'Test', category: 'Test', price: 123)
    @product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'dish.png')), filename: 'dish.png')
  end

  it 'Valid product' do
    expect(@product.valid?).to be true
  end

  it 'invalid title' do
    @product.title = '1'
    expect(@product.valid?).to be false
    expect(@product.errors.count).to be 2
  end

  it 'invalid price' do
    @product.price = 'asv'
    expect(@product.valid?).to be false
  end

  it 'invalid category' do
    @product.category = 'a' * 21
    expect(@product.valid?).to be false
  end

  it 'no image' do
    @product.image = nil
    expect(@product.valid?).to be false
  end
end
