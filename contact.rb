class Contact
	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes

	@@id = 1
	@@contacts = []

	def initialize(first_name, last_name, email, notes)
			@first_name = first_name
			@last_name = last_name
			@email = email
			@notes = notes
			@id = @@id
      @@id += 1
	end

	def self.create(first_name, last_name, email, notes)
		 	new_contact = Contact.new(first_name, last_name, email, notes)
		 	@@contacts << new_contact
	end

	def self.all
			@@contacts
	end

	def full_name
			"#{first_name} #{last_name}"
	end

	def self.find(contact_id)
    @@contacts.find { |contact| contact.id == contact_id }
  end

   def remove
    @@contacts.delete_if { |contact| contact.id == self.id }
  end
 end




#def first_name
#	@first_name
#end

#def first_name=(new_first_name)
#  @first_name = new_first_name
#end

