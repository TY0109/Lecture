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

User.create!(name: "大学生2",
             email: "sampleB@email.com",
             password: "password",
             password_confirmation: "password" ,
             uni:true)

User.create!(name: "高校生1",
             email: "sample-1@email.com",
             password: "password",
             password_confirmation: "password" ,
             high:true)
             

User.create!(name: "高校生2",
             email: "sample-2@email.com",
             password: "password",
             password_confirmation: "password" ,
             high:true)


Post.create!(title: "マクロ経済A",
            description: "財政政策や金融政策の効果について学びます",
            user_id:2)
            

Post.create!(title: "ミクロ経済A",
            description: "消費者や企業の行動ついて学びます",
            user_id:3)
            


puts "Users Created"

puts "Posts Created"

