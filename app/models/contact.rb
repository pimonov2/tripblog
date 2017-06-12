class Contact < MailForm::Base
	attribute :name,    :validate => true
	attribute :email,    :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :banner_image_url
	attribute :message,    :validate => true
	

   def headers 
    {
  :subject => "Контактная форма",
  :to => "pimonov2@gmail.com",
  :form => %("#{name}" <#{email}> <#{banner_image_url}> <#{message}>)
   }
   	
  end 

end