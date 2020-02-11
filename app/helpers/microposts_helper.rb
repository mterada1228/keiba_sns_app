module MicropostsHelper

  # レーステーブルを加工して馬ハッシュを作成する
  def create_hose_table(race)
    
    hose = {hose1: {name: race.hose1_name, gate_num: race.hose1_gate_number, gate_col: race.hose1_gate_color, hose_num: race.hose1_number},
            hose2: {name: race.hose2_name, gate_num: race.hose2_gate_number, gate_col: race.hose2_gate_color, hose_num: race.hose2_number}, 
            hose3: {name: race.hose3_name, gate_num: race.hose3_gate_number, gate_col: race.hose3_gate_color, hose_num: race.hose3_number},
            hose4: {name: race.hose4_name, gate_num: race.hose4_gate_number, gate_col: race.hose4_gate_color, hose_num: race.hose4_number},
            hose5: {name: race.hose5_name, gate_num: race.hose5_gate_number, gate_col: race.hose5_gate_color, hose_num: race.hose5_number},
            hose6: {name: race.hose6_name, gate_num: race.hose6_gate_number, gate_col: race.hose6_gate_color, hose_num: race.hose6_number},
            hose7: {name: race.hose7_name, gate_num: race.hose7_gate_number, gate_col: race.hose7_gate_color, hose_num: race.hose7_number},
            hose8: {name: race.hose8_name, gate_num: race.hose8_gate_number, gate_col: race.hose8_gate_color, hose_num: race.hose8_number},
            hose9: {name: race.hose9_name, gate_num: race.hose9_gate_number, gate_col: race.hose9_gate_color, hose_num: race.hose9_number},
            hose10: {name: race.hose10_name, gate_num: race.hose10_gate_number, gate_col: race.hose10_gate_color, hose_num: race.hose10_number},
            hose11: {name: race.hose11_name, gate_num: race.hose11_gate_number, gate_col: race.hose11_gate_color, hose_num: race.hose11_number},
            hose12: {name: race.hose12_name, gate_num: race.hose12_gate_number, gate_col: race.hose12_gate_color, hose_num: race.hose12_number},
            hose13: {name: race.hose13_name, gate_num: race.hose13_gate_number, gate_col: race.hose13_gate_color, hose_num: race.hose13_number},
            hose14: {name: race.hose14_name, gate_num: race.hose14_gate_number, gate_col: race.hose14_gate_color, hose_num: race.hose14_number},
            hose15: {name: race.hose15_name, gate_num: race.hose15_gate_number, gate_col: race.hose15_gate_color, hose_num: race.hose15_number},
            hose16: {name: race.hose16_name, gate_num: race.hose16_gate_number, gate_col: race.hose16_gate_color, hose_num: race.hose16_number},
            hose17: {name: race.hose17_name, gate_num: race.hose17_gate_number, gate_col: race.hose17_gate_color, hose_num: race.hose17_number},
            hose18: {name: race.hose18_name, gate_num: race.hose18_gate_number, gate_col: race.hose18_gate_color, hose_num: race.hose18_number}
    }
    
    return hose

  end
end
