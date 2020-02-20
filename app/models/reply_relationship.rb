class ReplyRelationship < ApplicationRecord
  belongs_to :reply_post, class_name: "Micropost"
  belongs_to :replied_post, class_name: "Micropost"
end
