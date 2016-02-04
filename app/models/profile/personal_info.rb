class Profile::PersonalInfo < Profile

  validates_presence_of :name, :surname

end