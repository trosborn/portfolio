require "test_helper"

describe PostAttachment do
  let(:post_attachment) { PostAttachment.new }

  it "must be valid" do
    post_attachment.must_be :valid?
  end
end
