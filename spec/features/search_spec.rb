require 'spec_helper.rb'

feature "Looking up recipes", js: true do
  before do
    Recipe.create!(name: 'Baked Potato w/ Cheese')
    Recipe.create!(name: 'Garlic Mashed Potatoes')
    Recipe.create!(name: 'Potatoes Au Gratin')
    Recipe.create!(name: 'Baked Brussel Sprouts')
  end
  scenario "finding recipes" do
    visit '/'
    fill_in "keywords", with: "baked"
    click_on "Search"
    expect(page).to have_content("Receta")
    expect(page).to have_content("The simplest cookbook")
    expect(page).to have_content("Results")
    expect(page).to have_content("Baked Potato")
    expect(page).to have_content("Baked Brussel Sprouts")
  end
  scenario "No result found" do
    visit '/'
    fill_in "keywords", with: "toto"
    click_on "Search"
    expect(page).to have_content("No result found.")
  end
end