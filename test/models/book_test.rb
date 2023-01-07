require "test_helper"

class BookTest < ActiveSupport::TestCase
  validates :title, presence: true
  validates :body, presence: true
  # test "the truth" do
  #   assert true
  # end
end
