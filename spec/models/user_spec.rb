require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      # ユーザー新規登録についてのテストコードを記述します  
    context '新規登録できる場合' do
        it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_kanaとfirst_kana、birthdayが存在すれば登録できる" do
          expect(@user).to be_valid
      end


      it 'passwordが半角英数字の混合であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end

      it 'お名前が全角で入力してあれば登録できる' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it 'お名前カナが全角カタカナで入力してあれば登録できる' do
        @user.last_kana = 'ヤマダ'
        @user.first_kana = 'タロウ'
        expect(@user).to be_valid
      end

      it '誕生日が入力してあれば登録できる' do
        @user.birthday = '1984-01-11'
        expect(@user).to be_valid
      end


    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは@を含んでいなければ登録できない" do 
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end


      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角英数字の混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password . Include both letters and numbers")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123abd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前が空では登録できない' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters", "First name can't be blank", "First name is invalid. Input full-width characters")
      end

      it 'お名前が全角で入力していなければ登録できない' do
        @user.last_name = 'ﾔﾏﾀ'
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters", "First name is invalid. Input full-width characters")
      end

      it 'お名前カナが空では登録できない' do
        @user.last_kana = ''
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank", "Last kana is invalid. Input full-width katakana characters", "First kana can't be blank", "First kana is invalid. Input full-width katakana characters")
      end

      it 'お名前カナが全角カタカナで入力していなければ登録できない' do
        @user.last_kana = 'ﾔﾏﾀ'
        @user.first_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid. Input full-width katakana characters", "First kana is invalid. Input full-width katakana characters")
      end

      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
