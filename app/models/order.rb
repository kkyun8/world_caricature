class Order < ApplicationRecord
  # order作成前なので、以下の値は空欄にする
  # validates :id, absence: true

  # idは0以上の整数
  validates :sample_image_id, presence: true

  # フレームはMかL
  # validates :flame_size, presence: true, inclusion: { in: [ %w(M), %w(L) ] }
  validates :premium_wrapping, inclusion: { in: [ true, false ]}
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 5000, less_then: 100000 }
  # 全角ひらがな、全角カタカナ、漢字 文字数は20文字
  validates :name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }, length: { maximum:60 }
  # 全角ひらがな、カタカナ 文字数は20文字
  validates :name_furigana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }, length: { maximum:60 }

  # メールアドレスかラインIDは入力必須
  validates :email_line, presence: true
  
  # E-mail フォーマット
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # 小文字の半角英数字と3種類の記号「.」「-」「_」のみ（大文字NG）
  validates :line_id, format: { with: /\A[a-z|.|\-|_]+\z/ }

  # ハイフンなし 10桁
  validates :cell_phone_number, presence: true, numericality: { only_integer: true }, length: {minimum:11, maximum:11}
  # ハイフンなし 10桁or11桁
  validates :home_phone_number, numericality: { only_integer: true }, length: {minimum:10, maximum:11}
  # ハイフンなし 7桁
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  
  # 全角ひらがな、全角カタカナ、漢字 文字数は20文字
  validates :address1, presence: true, length: { maximum:60 }

  validates :address2, presence: true, length: { maximum:60 }

  validates :comment, length: { maximum:255 }

  private 
    def email_line
      email.presence or line_id.presence
    end

end