User.create!( name: "管理人",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin:true,
              student:1)

User.create!( name: "ゲスト管理人",
              email: "guest_admin@email.com",
              password: "password",
              password_confirmation: "password",
              admin:true,
              student:1)

User.create!( name: "ゲストユーザー",
              email: "guest@email.com",
              password: "password",
              password_confirmation: "password",
              student:1)

User.create!( name: "大学生1",
              email: "uniA@email.com",
              password: "password",
              password_confirmation: "password",
              student:0)

User.create!( name: "大学生2",
              email: "uniB@email.com",
              password: "password",
              password_confirmation: "password",
              student:0)

User.create!( name: "高校生1",
              email: "highA@email.com",
              password: "password",
              password_confirmation: "password",
              student:1)

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
             
             


puts "Users Created"
puts "Posts Created!"