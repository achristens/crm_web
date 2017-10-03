gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :note, as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

  # @@contacts = []
  # @@id       = 1

  # This method should initialize the contact's attributes
  # def initialize(first_name, last_name, email, notes = 'N/A')
  #   @first_name = first_name
  #   @last_name  = last_name
  #   @email      = email
  #   @notes      = notes
  #
  #   @id         = @@id
  #   @@id       += 1
  # end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  # def self.create(first_name, last_name, email, notes = 'N/A')
  #   new_contact = Contact.new(first_name, last_name, email, notes)
  #   @@contacts << new_contact
  #   return new_contact
  # end

  # This method should return all of the existing contacts
  # def self.all
  #   return @@contacts
  # end

  # This method should accept an id as an argument
  # and return the contact who has that id
  # def self.find(id)
  #   @@contacts.find { |contact| contact.id == id }
  # end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  # def update(var, new_val)
  #   send("#{var}=", new_val)
  #
  #   # ALTERNATIVE METHOD
  #   # case var
  #   # when 'first_name'
  #   #   self.first_name=(new_val)
  #   # when 'email'
  #   #   self.email=(new_val)
  #   # when 'last_name'
  #   #   self.last_name=(new_val)
  #   # when 'notes'
  #   #   self.notes=(new_val)
  #   # else
  #   #   raise "Can't update '#{var}' with '#{new_val}'"
  #   # end
  # end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  # def self.find_by(attribute, value)
  #   @@contacts.find { |contact| contact.send(attribute) == value }
  # end
  #
  # # This method should delete all of the contacts
  # def self.delete_all
  #   @@contacts.clear
  # end


  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  # def delete
  #   @@contacts.delete(self)
  # end

  # # Feel free to add other methods here, if you need them.
  # # WRITERS
  # def first_name=(first_name)
  #   @first_name = first_name
  # end
  #
  # def last_name=(last_name)
  #   @last_name = last_name
  # end
  #
  # def email=(email)
  #   @email = email
  # end
  #
  # def notes=(notes)
  #   @notes = notes
  # end
  #
  # # READERS
  # def first_name
  #   @first_name
  # end
  #
  # def last_name
  #   @last_name
  # end
  #
  # def email
  #   @email
  # end
  #
  # def notes
  #   @notes
  # end
  #
  # def id
  #   @id
  # end
end

Contact.auto_upgrade!
# abby = Contact.create("abby", "christens", 'abby@gmail.com')
# matt = Contact.create("Matt", "Test", "email")
# # puts abby.notes
# # abby.update("notes", "new notes")
# p Contact.find_by("first_name", "Matt")
# # abby.first_name = "Abigail"
# puts abby.notes

 # abby.update
 #  "which variable woudl you like to update"
 #  var = gets.chomp
 #  => first_name
 #  "what is the new value for this field?"
 #  new_val = gets.chomp
 #  => "Abigail"
 #
 #  self.find { |variable, value| variable.var = new_val }
 #  @@contacts.find { |contact| contact.id == id }
