class Contact < MailForm::Base
	attribute :name,    :validate => true
	attribute :email,    :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message,    :validate => true
	

   def headers 
    {
  :subject => "Контактная форма",
  :to => "pimonov2@gmail.com",
  :form => %("#{name}" <#{email}>)
   }
   	
  end 

end