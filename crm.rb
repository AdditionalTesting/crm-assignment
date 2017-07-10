require_relative 'contact.rb'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
     when 1 then add_new_contact
     when 2 then modify_existing_contact
     when 3 then delete_contact
     when 4 then display_all_contacts
     when 5 then search_by_attribute
     when 6 then exit # exit here for 6
     end
  end

  def add_new_contact
  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  contact = Contact.create(
  first_name: first_name,
  last_name: last_name,
  email: email,
  note: note,
  )

  end

  def modify_existing_contact
    print "Who's contact would you like to modify?"
    print "Please enter their first name: "
    name = gets.chomp

    print "Which attribute would you like to change?"
    attribute = gets.chomp

    print "What would you like to chance it to?"
    value = gets.chomp

    Contact.find_by_first_name(name).update_attributes(attribute => value)
  end

  def delete_contact
    print "Please enter the first name of the contact you would like to delete"
    name = gets.chomp
    Contact.find_by_first_name(name).delete
  end

  def display_all_contacts
   print Contact.all.inspect
  end

  def search_by_attribute
    print "What attribute would you like to search by:"
    input = gets.chomp
    print "what is the #{input} :"
    value = gets.chomp

    print Contact.find_by_first_name(value).inspect


  end


end

at_exit do
  ActiveRecord::Base.connection.close
end
