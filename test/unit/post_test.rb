require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "that we are running on sqlite3" do
    assert_equal "SQLite", ActiveRecord::Base.connection.adapter_name
  end
end
