module CalendarsHelper
  def calc_protein(age, weight, level, essential_cal)
    # タンパク質のエネルギー比率の範囲計算
    min_protein_per = case age
    when 0..49
      13
    when 50..64
      14
    else
      15
    end
    max_protein_per = 20
    
    # タンパク質の範囲を計算
    min_protein_1 = (essential_cal * min_protein_per / 100) / 4
    max_protein_1 = (essential_cal * max_protein_per / 100) / 4
    
    # 推奨摂取量の範囲
    min_protein_2 = weight * 0.8
    max_protein_2 = weight * 2.0
    
    # ①と②のどちらにも当てはまる範囲を計算
    overlap_min = [min_protein_1, min_protein_2].max
    overlap_max = [max_protein_1, max_protein_2].min
    
    # ③の範囲を活動レベルに応じて設定
    case level
    when 2
      protein_range = overlap_min..overlap_min
    when 3
      protein_range = overlap_min..((overlap_max - overlap_min) / 4 + overlap_min)
    when 4
      protein_range = (overlap_min + (overlap_max - overlap_min) / 4)..((overlap_max - overlap_min) / 2 + overlap_min)
    when 5
      protein_range = ((overlap_max - overlap_min) / 2 + overlap_min)..((overlap_max - overlap_min) * 3 / 4 + overlap_min)
    when 6
      protein_range = overlap_max..overlap_max
    else
      protein_range = overlap_min..overlap_max
    end
  end

end
