require 'spec_helper'

describe 'home page' do
  it 'has photos' do
    visit root_path
    expect(page).to have_css('.photo')
  end

  it 'has featured photo' do
    visit root_path
    expect(page).to have_css('.featured-photo')
  end

  it 'has links to each thumbnail' do
    photo1 = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )

    visit root_path
    save_and_open_page
    find("#1").click
    photo = find(".featured-photo")
    expect(photo).to have_css("#1")
  end
end
