class CommentMailer < ActionMailer::Base
  default from: "tosborn@u.washington.edu"

  def new_comment comment, commentable
    @comment = comment
    @commentable = commentable
    mail to: 'tosborn@u.washington.edu', subject: "yolo"
  end
end
