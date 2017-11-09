class Contact
  @@all_contacts = []
  @@id = 1
  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end
  def first_name
   @first_name
  end

  def last_name
    @last_name
  end

  def first_name= first_name
    @first_name = first_name
  end

  def last_name= last_name
    @last_name = last_name
  end

  def email
    @email
  end

  def email= email
    @email = email
  end

  def note= note
    @note = note
  end

  def id
    @id
  end

  def id= id
    @id = id
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@all_contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@all_contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    Contact.all.each do |c|
      if c.id == id
        return c
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def self.update(id, selector, input)
    contact = Contact.find(id)
    if selector == "@first_name"
      contact.first_name = input
    elsif selector == "@last_name"
      contact.last_name = input
    else selector == "@note"
      contact.note = input
    # else selector == @email
    #   contact.email = input
    end
  end

  # # This method should work similarly to the find method above
  # # but it should allow you to search for a contact using attributes other than id
  # # by specifying both the name of the attribute and the value
  # # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  #

  def self.find_by
   puts "Please enter the keyword"
   search_element = gets.chomp
   Contact.all.each do |contact|
     if search_element == contact.first_name || search_element == contact.last_name || search_element == contact.email
       puts contact.full_name
     end
    end
  end
  #
  # This method should delete all of the contacts
  def self.delete_all
    @@all_contacts.clear
  end

  def full_name
    puts "#{@first_name} #{@last_name}"
  end
#
#   # This method should delete the contact
#   # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(id)
    item = Contact.find(id)
    @@all_contacts.delete(item)
  end
#
#   # Feel free to add other methods here, if you need them.
#
end
betty = Contact.create('Betty','Maker','bettymakes@gmail.com','Loves Pokemon.')
octo = Contact.create('Octo', 'Cat', 'octocat@github.com', 'Is it an octopus? Is it a cat?')
