require 'spec_helper'

describe Task do
  it {should validate_presence_of(:name)}
  it {should :status.eql(false)}
  it {should belong_to(:list)}
  it {should have_one(:reminder)}
end
