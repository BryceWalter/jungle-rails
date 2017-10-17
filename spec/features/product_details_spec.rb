require 'rails_helper'

RSpec.feature "Visitor selects a single product", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'they see a single product page' do

    visit root_path

    find('h4').click

    expect(page).to have_content 'Description'

    save_screenshot
  end

end
