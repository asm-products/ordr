
john = User.create(name: "John", :password => "password1234", :email => "john@example.com")
jane = User.create(name: "Jane", password: "password4321", email: "jane@example.com")

amazon = Job.create(user: john, company_name: "Amazon", title: "Mobile App Software Developer", url: "www.amazon.com/gp/jobs/245895/ref=j_sr_7_t?ie=UTF8&category=*&jobSearchKeywords=developer&location=*&page=1", type: "Mobile Dev")
google = Job.create(user: john, company_name: "Google", title: "Junior Developer", url: "www.google.com/about/careers/", type: "online")
subway = Job.create(user: john, company_name: "Subway", title: "Subway Artist", url: "www.google.com/about/careers/", type: "Artist Convention")
amazon.update_attributes(research: Research.new(company_mission: "Hardworking, Quick thinking, and Team Players", company_goals: "To take over the internet", current_projects: "Phones and Drones"))
amazon.update_attributes(job_application: JobApplication.new(sent: true))


test = User.create(email: 'test_user@localhost.com', password: 'securepassword')
