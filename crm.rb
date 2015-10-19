#User Interface

require_relative 'rolodex.rb'

class CRM

	def initialize
		@rolodex = Rolodex.new #creates a new rolodex
	end

	def print_main_menu
			puts "1. Add Contact"
			puts "2. Modify Contact"
			puts "3. Delete Contact"
			puts "4. Display All contacts"
			puts "5. Display a Contact"
	end

	def main_menu #user interaction method
		print_main_menu
		puts "Select an option: "
		input = gets.chomp.to_i
		choose_option(input)
	end

	def choose_option(options)
		case options
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then delete_contact
		when 4 then display_all
		when 5 then display_one
		end
		 main_menu
	end

	def add_contact
		puts "Input first name: "
		first_name = gets.chomp

		puts "Input last name: "
		last_name = gets.chomp

		puts "Input email"
		email = gets.chomp

		puts "Input note"
		note = gets.chomp

		@rolodex.add_contact(first_name, last_name, email, note)
	end

	def modify_contact
		puts "Input user ID to modify: "
		id = gets.chomp.to_i
		print_modify_menu
		contact = @rolodex.search(id)
		input = gets.chomp.to_i

		if input == 1
			puts "Input new first name: "
			new_name = gets.chomp
			contact.first_name = new_name
		elsif input == 2
			puts "Input new last name: "
			new_name = gets.chomp
			contact.last_name = new_name
		elsif input == 3
			puts "Input new email"
			new_email = gets.chomp
			contact.email = new_email
		elsif input == 4
			puts "Input new note:"
			new_note = gets.chomp
			contact.notes = new_note
		end
	end

	def print_modify_menu
		puts "1. Modify First Name"
		puts "2. Modify Last Name"
		puts "3. Modify Email"
		puts "4. Modify Notes"
	end

	def delete_contact
		puts "Which contact to delete?"
		puts "Enter ID#:"
		@rolodex.delete_id(input_id)
	end

	def display_all
		@rolodex.contacts.each do |x|
			puts x
		end
	end

	def display_one
		print "Enter the ID of the contact you want to display: "
		id = gets.chomp.to_i
		@rolodex.display_a_contact(id)
	end
end

app = CRM.new
app.main_menu	