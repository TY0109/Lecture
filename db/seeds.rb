User.create!( name: "管理人",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin:true)

User.create!( name: "ゲスト管理人",
              email: "guest_admin@email.com",
              password: "password",
              password_confirmation: "password",
              admin:true)

User.create!( name: "ゲストユーザー",
              email: "guest@email.com",
              password: "password",
              password_confirmation: "password")

User.create!( name: "大学生1",
              email: "uniA@email.com",
              password: "password",
              password_confirmation: "password",
              student:1)

User.create!( name: "大学生2",
              email: "uniB@email.com",
              password: "password",
              password_confirmation: "password",
              student:1)

User.create!( name: "高校生1",
              email: "highA@email.com",
              password: "password",
              password_confirmation: "password",
              student:2)




Post.create!(university: "A大学",
             department: "経済学部",
             branch: "経済学科",
             title: "マクロ経済A",
             description: "財政政策や金融政策の効果について学びます。金融緩和を行うと、金利が下がると言われています。しかし、ゼロ金利とも言われている現代においては効果は薄いです、金利が下がると、自国通貨の価値は下がります。そのため、海外の通貨の預金が集中し円安になる可能性があります。",
             user_id:4)

Post.create!(university: "A大学",
             department: "経済学部",
             branch: "経済学科",
             title: "微分積分",
             description: "数学を使って、経済モデルを分析します。",
             user_id:4)
            

Post.create!(university: "B大学",
             department: "経済学部",
             branch: "経済学科",
             title: "ミクロ経済A",
             description: "消費者や企業の行動ついて学びます。",
             user_id:5)
 
 
Post.create!(university: "B大学",
             department: "農学部",
             branch: "生物学科",
             title: "生物学基礎",
             description: "生物学の基礎について学びます。",
             user_id:5)            
             
             
             
             
60.times do |n|
  name=Faker::Name.name
  email="sample-#{n+1}@email.com"
  password="password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password )
end


puts "Users Created"
puts "Posts Created!"