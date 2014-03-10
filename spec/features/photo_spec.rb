require 'spec_helper'

describe 'home page' do
  it 'has photo' do
    visit root_path
    expect(page).to have_css('.photo')
  end

  it 'has featured photo' do
    visit root_path
    expect(page).to have_css('.featured-photo')
  end

  it 'has links to each thumbnail' do
    visit root_path
    page.all('.photo')[2].click
  end
end
