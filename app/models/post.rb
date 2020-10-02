class Post < ApplicationRecord
  validates :image, :text, presence: true
  belongs_to :user
  has_many :comments

  validates :image, :text, presence: true
  validates :image, format: { with: /\A(https\:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)+[\S]{11}\z/, message: 'はYouTubeのURLを入力してください' }

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
