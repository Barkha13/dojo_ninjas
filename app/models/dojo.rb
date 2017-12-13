class Dojo < ActiveRecord::Base
    has_many :ninjas, dependent: :destroy
    validates :name,:city,:state, presence: true
    validates :state, length { is:2 }
end

# 6. Using ruby console
# 6.1 Delete the three dojos you created
Dojo.destroy_all

# 6.2 Create 3 additional dojos by using Dojo.new.
dojo1 = Dojo.new(name: "CodingDojo Seattle", city: "Seattle", state: "WA")
dojo1.save
dojo2 = Dojo.new(name: "CodingDojo Silicon Valley", city: "Mountain View", state: "CA")
dojo2.save
dojo3 = Dojo.new(name: "CodingDojo New York", city: "New York", state: "NY")
dojo3.save

# 6.3 Try to create a few more dojos but without specifying some of the required fields. Make sure that the validation works and generates the errors.
dojo = Dojo.new(name: "CodingDojo Los Angeles", city: "Los Angeles")
dojo.save
dojo.errors.full_messages # => ["State can't be blank", "State is the wrong length (should be 2 characters)"]

dojo = Dojo.new(name: "CodingDojo Los Angeles", state: "CA")
dojo.save
dojo.errors.full_messages # => ["City can't be blank"]

dojo = Dojo.new(city: "Los Angeles", state: "CA")
dojo.save
dojo.errors.full_messages # => ["Name can't be blank"]

# 6.4 Create 3 ninjas that belong to the first dojo you created.
Dojo.first.ninjas.create(first_name: "John", last_name: "Doe")
Dojo.first.ninjas.create(first_name: "Jane", last_name: "Doe")
Dojo.first.ninjas.create(first_name: "Jennifer", last_name: "Doe")

# 6.5 Create 3 more ninjas and have them belong to the second dojo you created.
Dojo.second.ninjas.create(first_name: "Michael", last_name: "Smith")
Dojo.second.ninjas.create(first_name: "Michelle", last_name: "Smith")
Dojo.second.ninjas.create(first_name: "Mitchell", last_name: "Smith")

# 6.6 Create 3 more ninjas and have them belong to the third dojo you created.
Dojo.third.ninjas.create(first_name: "Kevin", last_name: "Johnson")
Dojo.third.ninjas.create(first_name: "Kyle", last_name: "Johnson")
Dojo.third.ninjas.create(first_name: "Kurt", last_name: "Johnson")

# 7. Make sure you understand how to get all of the ninjas for any dojo (e.g. get all the ninjas for the first dojo, second dojo, etc)
Dojo.first.ninjas
Dojo.second.ninjas
Dojo.third.ninjas

# 8. How would you only retrieve the first_name of the ninja that belongs to the second dojo and order the result by created_at DESC order?  
Ninja.where(dojo: Dojo.second).select(:id, :first_name).order(created_at: :desc)