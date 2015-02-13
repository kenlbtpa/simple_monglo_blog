class Blog
  include MongoMapper::Document

  before_validation :processBlog

  key :_id, Integer , :required => true
  key :blogger, Int , :required => true
  key :title, String , :required => true
  key :content, String , :required => true
  key :created_at, Time , :required => true
  key :updated_at, Time , :required => true

  private

  def processBlog
  	
	# Making Sure User exists
	if User.find( blogger ) === nil
		errors.add( :blogger , "Invalid Blogger" )
	end
  	
  	if self.created_at === nil
  		self.created_at = Time.now
  	end
	if self.updated_at === nil  	
	  	self.updated_at = Time.now
  	end
  
  end

end
