require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前、メール、パスワードがある場合、有効である" do
    user = User.new(
     name: "サンプルユーザー",
     email: "sample@email.com",
     password: "password",
     )
     expect(user).to be_valid
  end
end