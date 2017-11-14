require_relative'contact'
class CRM
  def initialize(name)
    @name = name
    puts "Hello this is CRM #{@name}. May i help you?"
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
    when 6 then exit
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

    # Contact.create(first_name, last_name, email, note)
    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
)

  end

  def modify_existing_contact
    puts "Please enter the id of the contact you want to modify."
    id = gets.chomp
    puts "enter first_name/last_name/email/note "
    key = gets.chomp
    puts "insert the new info ."
    value = gets.chomp
    edit_item = Contact.find_by_id(id)
    edit_item.update({key=>value} )
    puts "#{edit_item.inspect}saved."
  end



  def delete_contact
    puts 'Please entre the id of the contact you want to delete.'
    id = gets.chomp.to_i
    f= Contact.find_by_id(id)
    puts "#{f.inspect}going to be deleted."
    Contact.delete(f)

  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
   puts "you like to search by first_name/last_name or email"
   key = gets.chomp
   puts "please entre the word for searcing."
   value = gets.chomp
   target = Contact.find_by({key=>value})
   puts "#{target.inspect}"
  end

  def exit
    abort "bye~"
  end


end
crm = CRM.new("coco")
crm.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
