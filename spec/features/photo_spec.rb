require 'spec_helper'

describe 'home page' do

  before :all do
    # photo1 = Photo.create(
    #   standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
    #   thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
    #   )
    # photo2 = Photo.create(
    #   standard_url: "http://distilleryimage10.s3.amazonaws.com/284d3592aa0111e3aed71234e20b6cce_8.jpg",
    #   thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/284d3592aa0111e3aed71234e20b6cce_5.jpg"
    #   )
    # photo3 = Photo.create(
    #   standard_url: "http://distilleryimage10.s3.amazonaws.com/8e734618a27711e3adf212add793e3ba_8.jpg",
    #   thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/8e734618a27711e3adf212add793e3ba_5.jpg"
    #   )
  end

  before :each do
    photo1 = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )
    photo2 = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/284d3592aa0111e3aed71234e20b6cce_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/284d3592aa0111e3aed71234e20b6cce_5.jpg"
      )
    photo3 = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/8e734618a27711e3adf212add793e3ba_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/8e734618a27711e3adf212add793e3ba_5.jpg"
      )
    
    visit root_path
  end

  it 'has photos' do
    expect(page).to have_css('.photo')
  end

  it 'has featured photo' do
    expect(page).to have_css('.featured-photo')
  end

  it 'has links to each thumbnail' do
    find("#2").click
    photo = find(".featured-photo")
    within('#primary-picture') do
      expect(page).to have_css("#2")
    end
  end
end
