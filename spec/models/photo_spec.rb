require 'spec_helper'

describe Photo do
  it "has a standard resolution url" do
    photo = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )

    photo.standard_url.should eq("http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg")
  end

  it "has a thumbnail url" do
    photo = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )

    photo.thumbnail_url.should eq("http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg")
  end

  it 'requires standard resolution url' do
    photo = Photo.create(
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )

    photo.should_not be_valid
  end

  it 'requires thumbnail url' do
    photo = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg"
      )

    photo.should_not be_valid
  end

  it 'requires unique urls' do
    photo1 = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )

    photo2 = Photo.create(
      standard_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg",
      thumbnail_url: "http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg"
      )
    
    photo1.should be_valid
    photo2.should_not be_valid
  end
end
