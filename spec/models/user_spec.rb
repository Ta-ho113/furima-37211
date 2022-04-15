require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "メールアドレスが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードは、6文字以上での入力必須であること" do
      @user.password = 'test5'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "パスワードは、半角英数字混合での入力が必須必須であること" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "パスワード(確認)が必須であること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end
    it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password = 'test123456'
      @user.password_confirmation = 'tes1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "お名前(姓)が必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "お名前(姓)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "お名前(名)が必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "お名前(名)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "お名前(姓:カナ入力)が必須であること" do
      @user.last_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last katakana can't be blank"
    end
    it "お名前(姓:カナ入力)は、全角（カタカナ）での入力が必須であること。" do
      @user.last_katakana = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last katakana is invalid"
    end
    it "お名前(名:カナ入力)が必須であること" do
      @user.first_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First katakana can't be blank"
    end
    it "お名前(名:カナ入力)は、全角（カタカナ）での入力が必須であること。" do
      @user.first_katakana = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include "First katakana is invalid"
    end
    it "生年月日が必須であること" do
      @user.birth_day_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
  end
end