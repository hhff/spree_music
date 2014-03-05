require 'spec_helper'

describe Spree::Artist do

  it "should exist" do
    artist = create(:artist)
  end

  it "should be valid" do
    artist = create(:artist)
    artist.should be_valid
  end

end