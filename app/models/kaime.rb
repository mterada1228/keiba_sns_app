class Kaime < ApplicationRecord
  belongs_to :micropost, dependent: :destroy
  before_save do
    # チェックボックスの保存前に不要な文字をトリム
    self.first_hoses.gsub!(/[\[\]\"]/, "") if attribute_present?("first_hoses")
    self.second_hoses.gsub!(/[\[\]\"]/, "") if attribute_present?("second_hoses")
    self.third_hoses.gsub!(/[\[\]\"]/, "") if attribute_present?("third_hoses")
    trim_duplicate
    # TODO 買い目が一つも無ければ保存しない
  end
  
  private
  
    # 軸馬が相手に含まれていた場合除去する
    # TODO テストする
    def trim_duplicate
      
      if self.buy_type == "ながし"
        
        if !second_hoses.nil?
          second_hoses_arr = self.second_hoses.split(",")
          second_hoses_arr.each do |second_hose|
            second_hoses_arr.delete(second_hose) if second_hose.gsub(" ", "") == self.first_hoses
          end
          self.second_hoses = second_hoses_arr.join(',')
        end
      
        if !third_hoses.nil?
          third_hoses_arr = self.third_hoses.split(",")
          third_hoses_arr.each do |third_hose|
            third_hoses_arr.delete(third_hose) if third_hose.gsub(" ", "") == self.first_hoses || third_hose.gsub(" ", "") == self.second_hoses
          end
          self.third_hoses = third_hoses_arr.join(',')
        end
      end
    end
    
end
