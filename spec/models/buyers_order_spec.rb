require 'rails_helper'

RSpec.describe BuyersOrder, type: :model do
  describe '送付先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyers_order = FactoryBot.build(:buyers_order, user_id: user.id, item_id: item.id)
      sleep 0.1 # 0.1秒待機
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyers_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyers_order.building_name = ''
        expect(@buyers_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @buyers_order.token = nil
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberが空だと保存できないこと' do
        @buyers_order.post_number = ''
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyers_order.post_number = '12345678'
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'region_idを選択していないと保存できないこと' do
        @buyers_order.region_id = 1
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Region must be other than 1")
      end
      it 'house_numberが空だと保存できないこと' do
        @buyers_order.house_number = ''
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buyers_order.phone_number = ''
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値でなければ保存できないこと' do
        @buyers_order.phone_number = 'あかさたな'
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに(-)などの記号を含めない限り保存できないこと' do
        @buyers_order.phone_number = '090-1234-5678'
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyers_order.user_id = nil
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buyers_order.item_id = nil
        @buyers_order.valid?
        expect(@buyers_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
