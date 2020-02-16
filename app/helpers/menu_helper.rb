module MenuHelper
  
  # 馬印表示用のテーブルを作成する
  def create_hose_mark_tab(micropost)
    hose_mark = micropost.hosemark
    race = micropost.race

    hose_mark_table = { hose1: {name: race.hose1_name, hose_mark: hose_mark.hose1_mark},
           hose2: {name: race.hose2_name, hose_mark: hose_mark.hose2_mark},
           hose3: {name: race.hose3_name, hose_mark: hose_mark.hose3_mark},
           hose4: {name: race.hose4_name, hose_mark: hose_mark.hose4_mark},
           hose5: {name: race.hose5_name, hose_mark: hose_mark.hose5_mark},
           hose6: {name: race.hose6_name, hose_mark: hose_mark.hose6_mark},
           hose7: {name: race.hose7_name, hose_mark: hose_mark.hose7_mark},
           hose8: {name: race.hose8_name, hose_mark: hose_mark.hose8_mark},
           hose9: {name: race.hose9_name, hose_mark: hose_mark.hose9_mark},
           hose10: {name: race.hose10_name, hose_mark: hose_mark.hose10_mark},
           hose11: {name: race.hose11_name, hose_mark: hose_mark.hose11_mark},
           hose12: {name: race.hose12_name, hose_mark: hose_mark.hose12_mark},
           hose13: {name: race.hose13_name, hose_mark: hose_mark.hose13_mark},
           hose14: {name: race.hose14_name, hose_mark: hose_mark.hose14_mark},
           hose15: {name: race.hose15_name, hose_mark: hose_mark.hose15_mark},
           hose16: {name: race.hose16_name, hose_mark: hose_mark.hose16_mark},
           hose17: {name: race.hose17_name, hose_mark: hose_mark.hose17_mark},
           hose18: {name: race.hose18_name, hose_mark: hose_mark.hose18_mark} }
           
    hose_mark_table_sorted = []
    
    # 馬印 ◎
    hose_mark_table.each do |hose|
      hose_mark_table_sorted.push({ name: hose[1][:name], hose_mark: hose[1][:hose_mark] }) if hose[1][:hose_mark] == "◎"
    end
    
    # 馬印 ◯
    hose_mark_table.each do |hose|
      hose_mark_table_sorted.push({ name: hose[1][:name], hose_mark: hose[1][:hose_mark] }) if hose[1][:hose_mark] == "◯"
    end
    
    # 馬印 ▲
    hose_mark_table.each do |hose|
      hose_mark_table_sorted.push({ name: hose[1][:name], hose_mark: hose[1][:hose_mark] }) if hose[1][:hose_mark] == "▲"
    end
    
    # 馬印 △
    hose_mark_table.each do |hose|
      hose_mark_table_sorted.push({ name: hose[1][:name], hose_mark: hose[1][:hose_mark] }) if hose[1][:hose_mark] == "△"
    end
    
    # 馬印 ×
    hose_mark_table.each do |hose|
      hose_mark_table_sorted.push({ name: hose[1][:name], hose_mark: hose[1][:hose_mark] }) if hose[1][:hose_mark] == "×"
    end

    return hose_mark_table_sorted
    
  end
end
