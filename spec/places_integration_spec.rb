require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('place addition path', {:type => :feature}) do
  it('processes the user input and redirects to success page') do
    visit('/')
    fill_in('place_name', :with => "Moon")
    click_button('Add to Place List')
    expect(page).to(have_content('Your place has been added!'))
  end
end

describe('place list render path', {:type => :feature}) do
  it('renders the place list on the index page') do
    visit('/')
    fill_in('place_name', :with => "Moon")
    click_button('Add to Place List')
    click_link('Back')
    expect(page).to(have_content('Moon'))
  end
end
