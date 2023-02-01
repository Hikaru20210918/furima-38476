require 'rails_helper'
  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe "ユーザー新規登録" do

     context '新規登録できる場合' do
        it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
          expect(@user).to be_valid
          end
     end

     context '新規登録できない場合' do
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
         it "重複したemailが存在する場合は登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
        end
         it "emailは@を含まないと登録できない" do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end
         it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end
         it "passwordが5文字以下の場合は登録できない" do
           @user.password = '0000a'
           @user.password_confirmation = '0000a'
           @user.valid?
           expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
        end
         it "passwordが英字のみでは登録できない" do
            @user.password = 'aaaaaa'
            @user.password_confirmation = 'aaaaaa'
            @user.valid?
            expect(@user.errors.full_messages).to include "Password is invalid"
        end
         it "passwordが数字のみでは登録できない" do
            @user.password = '000000'
            @user.password_confirmation = '000000'
            @user.valid?
            expect(@user.errors.full_messages).to include "Password is invalid"
         end
          it "passwordに全角文字を含む場合は登録できない" do
            @user.password = '000000Ａ'
            @user.password_confirmation = '000000Ａ'
            @user.valid?
            expect(@user.errors.full_messages).to include "Password is invalid"
         end
          it "passwordとpassword_confirmationが不一致では登録できない" do
            @user.password_confirmation = '000000b'
            @user.valid?
            expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
          it "nicknameが空だと登録できない" do
            @user.nickname = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
          it "first_nameが空だと登録できない" do
            @user.first_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "First name can't be blank"
        end
           it "first_nameが全角文字でない場合は登録できない" do
            @user.first_name = 'ﾎﾘﾀ'
            @user.valid?
            expect(@user.errors.full_messages).to include "First name is invalid"
        end
            it "first_nameが英数字では登録できない" do
             @user.first_name = 'ＨＯＲＩＴＡ'
             @user.valid?
             expect(@user.errors.full_messages).to include "First name is invalid"
        end
            it "last_nameが空だと登録できない" do
             @user.last_name = ''
             @user.valid?
             expect(@user.errors.full_messages).to include "Last name can't be blank"
        end
            it "last_name_kanaが全角文字でない場合は登録できない" do
             @user.last_name = 'ﾏﾅﾐ'
             @user.valid?
            expect(@user.errors.full_messages).to include "Last name is invalid"
        end
            it "last_nameが英数字では登録できない" do
              @user.last_name = 'ＭＡＮＡＭＩ'
              @user.valid?
              expect(@user.errors.full_messages).to include "Last name is invalid"
        end
            it "first_name_kanaが空だと登録できない" do
              @user.first_name_kana = ''
              @user.valid?
              expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end
            it "first_name_kanaが全角カナ文字でない場合は登録できない" do
              @user.first_name = 'ﾎﾘﾀ'
              @user.valid?
              expect(@user.errors.full_messages).to include "First name is invalid"
        end
            it "last_name_kanaが空だと登録できない" do
              @user.last_name_kana = ''
              @user.valid?
              expect(@user.errors.full_messages).to include "Last name kana can't be blank"
         end
            it "last_name_kanaが全角カナ文字でない場合は登録できない" do
              @user.last_name = 'ﾏﾅﾐ'
              @user.valid?
              expect(@user.errors.full_messages).to include "Last name is invalid"
         end
            it "birthdayが空だと登録できない" do
              @user.birthday = ''
              @user.valid?
              expect(@user.errors.full_messages).to include "Birthday can't be blank"
         end
       end
    end
 end





