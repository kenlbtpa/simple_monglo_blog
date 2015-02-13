class User
  include MongoMapper::Document

  before_create :processUser

  key :nickname, String	, :required => true
  key :email, String	, :format => MongoBlog::Application::EMAIL_REGEX , :required => true
  key :pass, String		, :required => true
  key :pass_salt, String, :required => true
  key :perm, Integer	, :required => true , :default => 0
  key :created_at, Time	, :required => true 
  key :updated_at, Time	, :required => true 
  key :login_at, Time


  private

  def processUser
  	self.pass_salt = BCrypt::Engine.generate_salt
  	self.pass = BCrypt::Engine.hash_secret( self.pass , self.pass_salt )
  	if created_at === nil
  		self.created_at = Time.now
  	end
	if updated_at === nil  	
	  	self.created_at = Time.now
  	end
  end
end
