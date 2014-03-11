require 'spec_helper'

describe InstagramFetcher do

  subject { InstagramFetcher.new }

  describe 'fetching recent photos' do
    describe 'when new photo is available' do
      before do
        allow(subject.client).to receive(:user_recent_media).and_return(
          [ double('photo', images:
            { 'standard_resolution' => {'url' => 'http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg' },
              'thumbnail' => { 'url' => 'http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg' }
            })])
      end

      it 'creates new photos' do
        subject.recent_photos
        expect(Photo.last.standard_url).to eq('http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg')
        expect(Photo.last.thumbnail_url).to eq('http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg')
        expect(Photo.count).to eq(1)
      end
    end

    describe 'when no new photos are available' do
      before do
        Photo.create!(
          standard_url: 'http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg',
          thumbnail_url: 'http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg'
          )

        allow(subject.client).to receive(:user_recent_media).and_return(
          [ double('photo', images:
            { 'standard_resolution' => {'url' => 'http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_8.jpg' },
              'thumbnail' => { 'url' => 'http://distilleryimage10.s3.amazonaws.com/288b6860a7c411e38b890e44eb87a70a_5.jpg' }
            })])
      end
      
      it 'does not create duplicate photos' do
        expect(Photo.count).to eq(1)
        subject.recent_photos
        expect(Photo.count).to eq(1)
      end
    end
  end
end
