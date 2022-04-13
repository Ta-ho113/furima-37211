require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"John" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "John", email: "", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"John" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "encrypted_passwordが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"John" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "", last_name:"Lenon" , first_name:"John" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"" , first_name:"John" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_katakanaが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"John" , last_katakana:"" , first_katakana:"ジョン" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("Last katakana can't be blank")
    end
    it "first_katakanaが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"John" , last_katakana:"レノン" , first_katakana:"" , birth_day_id:"1940-10-09" )
      user.valid?
      expect(user.errors.full_messages).to include("First katakana can't be blank")
    end
    it "birth_day_idが空では登録できない" do
      user = User.new(nickname: "John", email: "john@test.com", encrypted_password: "tc000000", password_confirmation: "tc000000", last_name:"Lenon" , first_name:"John" , last_katakana:"レノン" , first_katakana:"ジョン" , birth_day_id:"" )
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end