User.create!(name: "管理人",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password" ,
             admin:true)
             
User.create!(name: "大学生1",
             email: "sampleA@email.com",
             password: "password",
             password_confirmation: "password" ,
             uni:true)

User.create!(name: "高校生1",
             email: "sample-1@email.com",
             password: "password",
             password_confirmation: "password" ,
             high:true)




puts "Users Created"