require "test_helper"

describe PostAttachmentsController do

  let(:post_attachment) { post_attachments :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_attachments)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates post_attachment" do
    assert_difference('PostAttachment.count') do
      post :create, post_attachment: {  }
    end

    assert_redirected_to post_attachment_path(assigns(:post_attachment))
  end

  it "shows post_attachment" do
    get :show, id: post_attachment
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: post_attachment
    assert_response :success
  end

  it "updates post_attachment" do
    put :update, id: post_attachment, post_attachment: {  }
    assert_redirected_to post_attachment_path(assigns(:post_attachment))
  end

  it "destroys post_attachment" do
    assert_difference('PostAttachment.count', -1) do
      delete :destroy, id: post_attachment
    end

    assert_redirected_to post_attachments_path
  end

end
