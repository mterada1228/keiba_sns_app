class Kaime < ApplicationRecord
  belongs_to :micropost, dependent: :destroy
  before_save do
    # チェックボックスの保存前に不要な文字をトリム
    self.first_hoses.gsub!(/[\[\]\"]/, "") if attribute_present?("first_hoses")
    self.second_hoses.gsub!(/[\[\]\"]/, "") if attribute_present?("second_hoses")
    self.third_hoses.gsub!(/[\[\]\"]/, "") if attribute_present?("third_hoses")
    trim_duplicate # 重複している買い目を除去
    check_nothing # 買い目が一つも無ければ保存しない
  end
  
  private
  
    # 軸馬が相手に含まれていた場合除去する
    # TODO テストする
    def trim_duplicate
      
      if self.buy_type == "ながし"
        
        if !second_hoses.nil?
          second_hoses_arr_before = self.second_hoses.split(",")
          second_hoses_arr_after = []
          second_hoses_arr_before.each do |second_hose|
            second_hoses_arr_after.push(second_hose) if !(second_hose.gsub(" ", "") == self.first_hoses)
          end
          self.second_hoses = second_hoses_arr_after.join(',')
        end
      
        if !third_hoses.nil?
          third_hoses_arr_before = self.third_hoses.split(",")
          third_hoses_arr_after = []
          third_hoses_arr_before.each do |third_hose|
            third_hoses_arr_after.push(third_hose) if !(third_hose.gsub(" ", "") == self.first_hoses || third_hose.gsub(" ", "") == self.second_hoses)
          end
          self.third_hoses = third_hoses_arr_after.join(',')
        end
      end
    end
    
    def check_nothing
      
      # ボックスの場合はどの券種でも1頭目しか埋まらない
      if self.buy_type == 'ボックス'
        throw(:abort) if self.first_hoses.blank?
        return
      end
      
      if self.baken_type.in?(['単勝', '複勝'])
        throw(:abort) if self.first_hoses.blank?
      elsif self.baken_type.in?(['馬連', '馬単', 'ワイド'])
        throw(:abort) if self.first_hoses.blank? || self.second_hoses.blank?
      else
        throw(:abort) if self.first_hoses.blank? || self.second_hoses.blank? || self.third_hoses.blank?
      end
      
    end
    
end
