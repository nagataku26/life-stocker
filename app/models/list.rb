class List < ApplicationRecord


  ICONS = %w(icon1.png icon2.png icon3.png icon4.png icon5.png icon6.png icon7.png icon8.png icon9.png icon10.png icon11.png icon12.png) # 使用可能なアイコンのリスト

  validates :selected_icon, inclusion: { in: ICONS }, allow_nil: true
end
