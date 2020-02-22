class ReplyRelationship < ApplicationRecord
  
  belongs_to :reply_post, class_name: "Micropost"
  belongs_to :replied_post, class_name: "Micropost"
  
  # リプライ時のコメント 
  attr_accessor :content
  
end