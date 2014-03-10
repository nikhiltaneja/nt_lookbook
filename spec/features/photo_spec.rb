require 'spec_helper'

describe 'home page' do
  it 'has photo' do
    visit root_path
    expect(page).to have_css('.photo')
  end

  it 'has featured-photo' do
    visit root_path
    expect(page).to have_css('.featured-photo')
  end
end
