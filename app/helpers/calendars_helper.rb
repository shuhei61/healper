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

    one_eight = (overlap_max - overlap_min) / 8
    one_four = (overlap_max - overlap_min) / 4
    half = (overlap_max - overlap_min) / 2
    
    # ③の範囲を活動レベルに応じて設定
    case level
    when 2
      protein_range = overlap_min..(overlap_min + one_eight)
    when 3
      protein_range = (overlap_min + one_eight)..(overlap_min + one_eight + one_four)
    when 4
      protein_range = (overlap_min + one_eight + one_four)..(overlap_min + one_eight + half)
    when 5
      protein_range = (overlap_min + one_eight + half)..(overlap_max - one_eight)
    when 6
      protein_range = (overlap_max - one_eight)..overlap_max
    else
      protein_range = overlap_min..overlap_max
    end

  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    @start_date = Date.today - 3.days
    @end_date = Date.today + 3.days
    @calendars = Calendar.where(user_id: current_user.id, date: @start_date..@end_date)

    @week_days = []

    7.times do |x|
      today_plans = []
      today_pre_plans = []
      @calendars.each do |calendar|
        today_plans.push(*calendar.calendar_foods.map { |cf| { food: cf.food, calendar_id: cf.calendar_id } }) if calendar.date == @start_date + x
        today_pre_plans.push(*calendar.calendar_pre_foods.map { |cf| { pre_food: cf.pre_food, calendar_id: cf.calendar_id } }) if calendar.date == @start_date + x
      end

      wday_num = @start_date.wday + x
      if wday_num > 6
        wday_num = wday_num - 7
      end

      days = { month: (@start_date + x).month, date: (@start_date+x).day, plans: today_plans, pre_plans: today_pre_plans, wday: wdays[wday_num]}
      @week_days.push(days)
    end

  end

end
