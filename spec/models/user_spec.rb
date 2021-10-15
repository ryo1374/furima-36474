require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_kanaとfirst_kana、birthdayが存在すれば登録できる' do
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

      it '苗字が全角で入力してあれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end

      it '名前が全角で入力してあれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it '苗字カナが全角カタカナで入力してあれば登録できる' do
        @user.last_kana = 'ヤマダ'
        expect(@user).to be_valid
      end

      it '名前カナが全角カタカナで入力してあれば登録できる' do
        @user.first_kana = 'タロウ'
        expect(@user).to be_valid
      end

      it '誕生日が入力してあれば登録できる' do
        @user.birthday = '1984-01-11'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは@を含んでいなければ登録できない' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password . Include both letters and numbers')
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password . Include both letters and numbers')
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

      it '苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank",'Last name is invalid. Input full-width characters')
      end

      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank",'First name is invalid. Input full-width characters')
      end


      it '苗字が全角で入力していなければ登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it '名前が全角で入力していなければ登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it '苗字カナが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank",'Last kana is invalid. Input full-width katakana characters')
      end

      it '名前カナが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank",'First kana is invalid. Input full-width katakana characters')
      end

      it '苗字カナが全角カタカナで入力していなければ登録できない' do
        @user.last_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid. Input full-width katakana characters')
      end

      it '名前カナが全角カタカナで入力していなければ登録できない' do
        @user.first_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid. Input full-width katakana characters')
      end

      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
