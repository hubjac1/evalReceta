require 'spec_helper.rb'

feature "Viewing a recipe", js: true do
  before do
    Recipe.create!(name: 'pancakes',
                   instructions: "mix all")
  end
  scenario "view home page" do
    visit '/'

    expect(page).to have_content("pancakes")
  end
end