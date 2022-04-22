require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品できるとき' do
      it "必須項目('商品画像'、'商品名'、'商品の説明'、'カテゴリー'、'商品の状態'、'配送料の負担'、'発送元の地域'、'発送までの日数'、'価格')が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it "商品画像が空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名が空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "商品の説明が空では登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "カテゴリーが未選択では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "商品の状態が未選択では登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it "配送料の負担が未選択では登録できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 1"
      end
      it "発送元の地域が未選択では登録できない" do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Region must be other than 1"
      end
      it "発送までの日数が未選択では登録できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date must be other than 1"
      end
      it "販売価格が空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "販売価格が¥300未満では登録できない" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "販売価格が¥10,000,000以上では登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "販売価格が半角数値以外では登録できない" do
        @item.price = 'kana'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end