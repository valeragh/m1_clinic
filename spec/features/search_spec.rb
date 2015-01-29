require 'spec_helper.rb'

feature "Loocing up recipes", js: true do
  scenario "finding recipes" do
    visit '/'
    fill_in "keywords", with: "крови"
    click_on "Поиск"

    expect(page).to have_content("Анализ крови")
    expect(page).to have_content("Развернутый анализ крови")
  end
end
