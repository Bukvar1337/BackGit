class User < ApplicationRecord
  #has_many :projects
  has_many :parents, class_name: "User",
            foreign_key: "parent_id", optional: true
   belongs_to :department, optional: true
end
