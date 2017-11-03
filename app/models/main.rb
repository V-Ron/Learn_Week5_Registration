class Main
  def initialize(first_name, last_name, email, user, password, address = "", city = "", state = "", zip = "", country="")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @user = user
    @password = password
    @address = address
    @city = city
    @state = state
    @zip = zip
    @country = country
    @valid = false
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def user
    @user
  end

  def password
    @password
  end

  def address
    @address
  end

  def city
    @city
  end

  def state
    @state
  end

  def zip
    @zip
  end

  def country
    @country
  end

  def valid
    @valid
  end

  def validswitch
    @valid = !@valid
  end

end
