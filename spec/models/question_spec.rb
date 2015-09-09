require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:body) }
    it { is_expected.to respond_to(:resolved) }
  end
end
