require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての情報が存在していれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'nicknameが40文字より多いと登録できない' do
      @user.nickname = Faker::Name.initials(number: 41)
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'email.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailを重複して登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordに数字無しで登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが6文字以上で登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角(漢字・ひらがな・カタカナ)以外だと登録できない' do
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角(漢字・ひらがな・カタカナ)以外だと登録できない' do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_checkが空だと登録できない' do
      @user.last_name_check = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name check can't be blank")
    end
    it 'last_name_checkがカタカナ以外では登録できない' do
      @user.last_name_check = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name check is invalid')
    end

    it 'first_name_checkが空だと登録できない' do
      @user.first_name_check = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name check can't be blank")
    end
    it 'first_name_checkがカタカナ以外では登録できない' do
      @user.first_name_check = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name check is invalid')
    end

    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
