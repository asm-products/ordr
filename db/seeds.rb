# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
john = User.create(name: "John", :password => "password1234", :email => "john@example.com")
jane = User.create(name: "Jane", password: "password4321", email: "jane@example.com")

amazon = Job.create(user: john, company: "Amazon", position: "Mobile App Software Developer", link: "www.amazon.com/gp/jobs/245895/ref=j_sr_7_t?ie=UTF8&category=*&jobSearchKeywords=developer&location=*&page=1")
google = Job.create(user: john, company: "Google", position: "Junior Developer", link: "www.google.com/about/careers/")

amazon_research = Research.find_or_initialize_by(job: amazon)
amazon.research.update_attributes(values: "Hardworking, Quick thinking, and Team Players", salary: "85k", location: "Seattle, WA")

amazon_network = Network.find_or_initialize_by(job: amazon)
amazon_network.update_attributes(date: "August 4th", time: "3:45 pm")

amazon_network_note = Note.create(notable: amazon_network, content: "Remember to ask about company values and the interview process")
amazon_network_contact = Contact.create(contactable: amazon_network, name: "Jane", :email "jane@example.com", company: "Amazon", phone: "206-555-5555", linkedin_url: "www.linkedin.com")
# note = Note.create(content: "Remember to call Jane about interview tips", notable_type: "Research", notable_id:  "53ac7aeb6d732d4d91030000")

