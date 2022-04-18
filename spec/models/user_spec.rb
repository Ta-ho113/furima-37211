require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "必須項目('ニックネーム'、'メールアドレス'、'パスワード'、'パスワード(確認)'、'お名前(姓・名)'、'お名前カナ(姓・名)'、'生年月日')が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "ニックネームが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "メールアドレスが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "メールアドレスは重複して登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "メールアドレスに@が含まれていなければ登録できない" do
        @user.email = 'testmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "パスワードが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "パスワードが5文字以下では登録できない" do
        @user.password = 'test5'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "パスワードが半角英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワードが半角数字のみでは登録できない" do
        @user.password = "444444"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワードが全角では登録できない" do
        @user.password = "DDD４４４"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "パスワード(確認)が空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
      end
      it "パスワードとパスワード（確認）は、値が一致しなければ登録できない" do
        @user.password = 'test123456'
        @user.password_confirmation = 'tes1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "お名前(姓)が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "お名前(姓)が全角（漢字・ひらがな・カタカナ）以外の入力では登録できない" do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "お名前(名)が空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "お名前(名)が全角（漢字・ひらがな・カタカナ）以外の入力では登録できない" do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "お名前カナ(姓)が空では登録できない" do
        @user.last_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last katakana can't be blank"
      end
      it "お名前カナ(姓)が全角（カタカナ）での入力では登録できない" do
        @user.last_katakana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last katakana is invalid"
      end
      it "お名前カナ(名)が空では登録できない" do
        @user.first_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First katakana can't be blank"
      end
      it "お名前カナ(名)が全角（カタカナ）での入力では登録できない" do
        @user.first_katakana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include "First katakana is invalid"
      end
      it "生年月日が空では登録できない" do
        @user.birth_day_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end