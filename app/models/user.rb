class User
  include MongoMapper::Document

  before_validation :processUser

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
  	
  	if self.pass_salt === nil
	  	self.pass_salt = BCrypt::Engine.generate_salt
	  	self.pass = BCrypt::Engine.hash_secret( self.pass , self.pass_salt )
	end
  	
  	if self.created_at === nil
  		self.created_at = Time.now
  	end
	if self.updated_at === nil  	
	  	self.updated_at = Time.now
  	end
  
  end
  
end
