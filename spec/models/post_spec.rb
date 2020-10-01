require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'アウトプットの保存' do
    context "アウトプットが保存できる場合" do
      it "画像とテキストがあればアウトプットは保存される" do
        expect(@post).to be_valid
      end
    end
    context "アウトプットが保存できない場合" do
      it 'ログインしていないとアウトプットできない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
      it "テキストがないとアウトプットは保存できない" do
        @post.text = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end  
      it "imageがないとアウトプットは保存できない" do
        @post.image = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end   
      it "ユーザーが紐付いていないとアウトプットは保存できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end