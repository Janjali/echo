require 'spec_helper'

describe Route do
  it { should belong_to(:account).touch(true) }
  it { should validate_presence_of(:account) }
end
