require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
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
    when 6 then abort("Goodbye")
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
    notes = gets.chomp

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:      notes
    )
  end

  def modify_existing_contact
    print "Enter the ID of the person you wish to update: "
    id = gets.to_i
    id = Contact.find(id)

    print "Enter the attribute to update: first_name', 'last_name', 'email', or 'note': "
    var = gets.chomp

    print "Enter the new value for the field: "
    new_val = gets.chomp

    id.update_attributes(var => new_val)
  end

  def delete_contact
    print "Enter the ID of the person you wish to delete: "
    id = gets.to_i
    id = Contact.find(id)
    id.delete
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    print "Enter the attribute to search by: "
    attribute = gets.chomp

    print "Enter the search term: "
    value = gets.chomp

    puts Contact.find_by(attribute => value).inspect
    # puts Contact.where(value = attribute)
  end
end


a_crm_app = CRM.new("a_crm_app")

a_crm_app.main_menu


at_exit do
  ActiveRecord::Base.connection.close
end
