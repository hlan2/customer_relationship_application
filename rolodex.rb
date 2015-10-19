#holds list of contacts
#running tally of ids
#behavior of rolodex is to find a given contact

require_relative "contacts.rb"


class Rolodex
attr_accessor :contacts, :found

	@@id = 1000 # class variable, this ID is going to be unique

	def initialize #what attritubes
		@contacts = []
	end	

	def find_contact_by_id(id)
		@contacts.each do |contact|
			if id == contact.id
				@found = true
				return contact
			end
		end
	end

	def display_a_contact(id)
    contact_to_display = find_contact_by_id(id)
    if @found == true
      print "ID: #{contact_to_display.id} / Name: #{contact_to_display.first_name} #{contact_to_display.last_name}/ "
      print "Email: #{contact_to_display.email} / Notes: #{contact_to_display.notes}"
    end
    puts
  end

	def add_contact(first_name, last_name, email, notes)
	 	@@id +=1
	 	new_contact = Contact.new(@@id, first_name, last_name, email, notes)
	 	@contacts << new_contact
	end

	def search(id) # this searches by ID
		found_contact = nil

		@contacts.each do |contact| # contact is an instance of class contact because we are shovelling in instanes of the contact class
			if contact.id == id # contact.id accesses
				found_contact = contact
			end
		end
		return found_contact
	end	

	def delete_id(lotso)

		to_delete = search(lotso)
		@contacts.delete(to_delete)
	end

	def find(contact_id)
		@contacts.find{|contact| contact.id == contact_id}
	end
end