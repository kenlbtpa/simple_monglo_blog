class User
  include MongoMapper::Document

  key :nickname, String
  key :email, String
  key :pass, String
  key :created_at, Datetime
  key :updated_at, Datetime
  key :login_at, Datetime

end
