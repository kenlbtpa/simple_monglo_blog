class Blog
  include MongoMapper::Document

  key :_id, Integer
  key :blogger, Int
  key :title, String
  key :content, String
  key :created_at, Time
  key :updated_at, Time

end
