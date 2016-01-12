require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('place addition path', {:type => :feature}) do
  it('processes the user input and redirects to success page') do
    visit('/')
    fill_in_entry_and_add_to_list()
    expect(page).to(have_content('Your place has been added!'))
  end
end

describe('place list render path', {:type => :feature}) do
  it('renders the place list on the index page') do
    visit('/')
    add_entry_then_click_back()
    expect(page).to(have_content('Moon'))
  end
end

describe('place list clear path', {:type => :feature}) do
  it('clears the place list on the index page') do
    visit('/')
    add_entry_then_click_back()
    clear_place_list()
    expect(page).to(have_content('Place list cleared'))
  end

  it('clears the place list on the index page') do
    visit('/')
    add_entry_then_clear()
    expect(page).not_to(have_content('Moon'))
  end
end

define_method(:fill_in_entry_and_add_to_list) do
  fill_in('place_name', :with => "Moon")
  click_button('Add to Place List')
end

define_method(:add_entry_then_click_back) do
  fill_in_entry_and_add_to_list()
  click_link('Back')
end

define_method(:clear_place_list) do
  click_button('Clear Place List')
end

define_method(:add_entry_then_clear) do
  add_entry_then_click_back()
  clear_place_list()
  click_link('Back')
end
