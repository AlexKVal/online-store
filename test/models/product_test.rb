require 'test_helper'

def new_product(image_url)
  Product.new(
    title: "My book title",
    description: "sdf",
    price: 1,
    image_url: image_url
  )
end

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attrs must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: 'Title should be long',
      description: 'a long text',
      image_url: 'picture.png'
    )

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 2
    assert product.valid?
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/e/t/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(
      title: products(:ruby).title,
      description: 'fff',
      price: 1,
      image_url: 'fred.gif'
    )

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  test "title length should be minimum 10" do
    product = Product.new(
      title: 'short',
      description: 'eee',
      image_url: 'picture.png'
    )

    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]
  end
end
