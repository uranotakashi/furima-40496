FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    chinese_character_last_name  {'山田'}
    chinese_character_first_name {'太郎'}
    katakana_last_name           {'ヤマダ'} 
    katakana_first_name          {'タロウ'} 
    date_of_birth                {'1990-01-01'}  
  end
end

