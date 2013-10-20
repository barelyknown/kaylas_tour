class SchoolAttributesBuilder

  attr_reader :row

  def initialize(row)
    @row = row
  end

  def attributes
    @attributes ||= begin
      attributes = {}
      attributes[:ipeds_id] = row["unitid"]
      attributes[:name] = row["institution name"]
      attributes[:as_of_year] = row["year"]
      attributes[:total_price_in_state_on_campus] = row["DRVIC2012.Total price for in-state students living on campus 2012-13"].to_i
      attributes[:total_price_out_of_state_on_campus] = row["DRVIC2012.Total price for out-of-state students living on campus 2012-13"].to_i
      attributes[:street_address] = row["HD2012.Street address or post office box"].strip if row["HD2012.Street address or post office box"].present?
      attributes[:city] = row["HD2012.City location of institution"].strip if row["HD2012.City location of institution"].present?
      attributes[:postal_code] = row["HD2012.ZIP code"].strip if row["HD2012.ZIP code"].present?
      attributes[:state_code] = row["HD2012.State abbreviation"].strip if row["HD2012.State abbreviation"].to_s.strip.present?
      attributes[:general_phone_number] = row["HD2012.General information telephone number"].strip if row["HD2012.General information telephone number"].present?
      attributes[:general_fax_number] = row["HD2012.Fax number"].strip if row["HD2012.Fax number"].present?
      attributes[:financial_aid_url] = row["HD2012.Financial aid office web address"].strip if row["HD2012.Financial aid office web address"].present?
      attributes[:admissions_url] = row["HD2012.Admissions office web address"].strip if row["HD2012.Admissions office web address"].present?
      attributes[:online_application_url] = row["HD2012.Online application web address"].strip if row["HD2012.Online application web address"].present?
      attributes[:net_price_calculator_url] = row["HD2012.Net price calculator web address"].strip if row["HD2012.Net price calculator web address"].present?
      attributes[:level_of_institution] = row["HD2012.Level of institution"].strip if row["HD2012.Level of institution"].present?
      attributes[:highest_level_of_offering] = row["HD2012.Highest level of offering"].strip
      attributes[:undergraduate_offering] = row["HD2012.Undergraduate offering"].strip
      attributes[:highest_degree_offered] = row["HD2012.Highest degree offered"].strip
      attributes[:longitude] = row["HD2012.Longitude location of institution"]
      attributes[:latitude] = row["HD2012.Latitude location of institution"]
      attributes[:open_to_the_general_public] = row["HD2012.Institution open to the general public"] == "Institution is open to the public"
      attributes[:status] = row["HD2012.Status of institution"].strip
      attributes[:occupational] = row["IC2012.Occupational"].to_s.include?("Yes")
      attributes[:academic] = row["IC2012.Academic"].to_s.include?("Yes")
      attributes[:religous_affiliation] = row["IC2012.Religious affiliation"] if row["IC2012.Religious affiliation"].present?
      attributes[:associates_degree] = row["IC2012.Associate's degree"].to_s.include?("Yes")
      attributes[:bachelors_degree] = row["IC2012.Bachelor's degree"].to_s.include?("Yes")
      attributes[:open_admissions] = row["IC2012.Open admission policy"].to_s.include?("Yes")
      attributes[:secondary_school_gpa_requirement] = row["IC2012.Secondary school GPA"] || "Not reported"
      attributes[:secondary_school_rank_requirement] = calculate_secondary_school_rank_requirement(row["IC2012.Secondary school rank"])
      attributes[:secondary_school_record_requirement] = calculate_secondary_school_rank_requirement(row["IC2012.Secondary school record"])
      attributes[:recommendations_requirement] = calculate_secondary_school_rank_requirement(row["IC2012.Recommendations"])
      attributes[:formal_demonstration_of_competencies_requirement] = calculate_secondary_school_rank_requirement(row["IC2012.Formal demonstration of competencies"])
      attributes[:admission_test_score_requirement] = calculate_secondary_school_rank_requirement(row["IC2012.Admission test scores"])
      attributes[:applicants] = row["IC2012.Applicants total"].to_i if row["IC2012.Applicants total"].present?
      attributes[:admissions] = row["IC2012.Admissions total"].to_i if row["IC2012.Admissions total"].present?
      attributes[:sat_reading_25th_percentile] = row["IC2012.SAT Critical Reading 25th percentile score"].to_i if row["IC2012.SAT Critical Reading 25th percentile score"].present?
      attributes[:sat_reading_75th_percentile] = row["IC2012.SAT Critical Reading 75th percentile score"].to_i if row["IC2012.SAT Critical Reading 75th percentile score"].present?
      attributes[:sat_math_25th_percentile] = row["IC2012.SAT Math 25th percentile score"].to_i if row["IC2012.SAT Math 25th percentile score"].present?
      attributes[:sat_math_75th_percentile] = row["IC2012.SAT Math 75th percentile score"].to_i if row["IC2012.SAT Math 75th percentile score"].present?
      attributes[:sat_writing_25th_percentile] = row["IC2012.SAT Writing 25th percentile score"].to_i if row["IC2012.SAT Writing 25th percentile score"].present?
      attributes[:sat_writing_75th_percentile] = row["IC2012.SAT Writing 75th percentile score"].to_i if row["IC2012.SAT Writing 75th percentile score"].present?
      attributes[:act_composite_25th_percentile] = row["IC2012.ACT Composite 25th percentile score"].to_i if row["IC2012.ACT Composite 25th percentile score"].present?
      attributes[:act_composite_75th_percentile] = row["IC2012.ACT Composite 75th percentile score"].to_i if row["IC2012.ACT Composite 75th percentile score"].present?
      attributes[:act_english_25th_percentile] = row["IC2012.ACT English 25th percentile score"].to_i if row["IC2012.ACT English 25th percentile score"].present?
      attributes[:act_english_75th_percentile] = row["IC2012.ACT English 75th percentile score"].to_i if row["IC2012.ACT English 75th percentile score"].present?
      attributes[:act_math_25th_percentile] = row["IC2012.ACT Math 25th percentile score"].to_i if row["IC2012.ACT Math 25th percentile score"].present?
      attributes[:act_math_75th_percentile] = row["IC2012.ACT Math 75th percentile score"].to_i if row["IC2012.ACT Math 75th percentile score"].present?
      attributes[:act_writing_25th_percentile] = row["IC2012.ACT Writing 25th percentile score"].to_i if row["IC2012.ACT Writing 25th percentile score"].present?
      attributes[:act_writing_75th_percentile] = row["IC2012.ACT Writing 75th percentile score"].to_i if row["IC2012.ACT Writing 75th percentile score"].present?
      attributes[:dual_credit] = row["IC2012.Dual credit"].to_s.include?("Yes")
      attributes[:life_experience_credit] = row["IC2012.Credit for life experiences"].to_s.include?("Yes")
      attributes[:all_remote] = row["IC2012.All programs offered completely via distance education"].to_s.include?("Yes")
      attributes[:study_abroad] = row["IC2012.Study abroad"].to_s.include?("Yes")
      attributes[:evenings_and_weekends] = row["IC2012.Weekend/evening  college"].to_s.include?("Yes")
      attributes[:calendar_system] = row["IC2012.Calendar system"].strip if row["IC2012.Calendar system"].present?
      attributes[:tuition_payment_plan] = row["IC2012.Tuition payment plan"].to_s.include?("Yes")
      attributes[:undergraduate_application_fee] = row["IC2012.Undergraduate application fee"].to_i if row["IC2012.Undergraduate application fee"].present?
      attributes[:on_campus_housing] = row["IC2012.Institution provide on-campus housing"].to_s.include?("Yes")
      attributes[:undergraduate_out_of_state_tuition_average] = row["IC2012_AY.Out-of-state average tuition for full-time undergraduates"].to_i if row["IC2012_AY.Out-of-state average tuition for full-time undergraduates"].present?
      attributes[:undergraduate_in_state_tuition] = row["Published in-state tuition 2012-13"].to_i if row["Published in-state tuition 2012-13"].present?
      attributes[:undergraduate_books_and_supplies] = row["IC2012_AY.Books and supplies 2012-13"].to_i if row["IC2012_AY.Books and supplies 2012-13"].present?
      attributes[:undergraduate_on_campus_room_and_board] = row["IC2012_AY.On campus, room and board 2012-13"].to_i if row["IC2012_AY.On campus, room and board 2012-13"].present?
      attributes[:undergraduate_percent_receiving_financial_aid] = (row["SFA1112.Percent of full-time first-time undergraduates receiving any financial aid"].to_i / 100.to_f) if row["SFA1112.Percent of full-time first-time undergraduates receiving any financial aid"].present?
      attributes[:undergraduate_average_financial_aid] = row["SFA1112.Average amount of federal, state, local or institutional grant aid received"].to_i if row["SFA1112.Average amount of federal, state, local or institutional grant aid received"].present?
      attributes[:member_of_ncaa] = row["IC2012.Member of National Collegiate Athletic Association (NCAA)"].to_s.include?("Yes")
      attributes[:member_of_naia] = row["IC2012.Member of National Association of Intercollegiate Athletics (NAIA)"].to_s.include?("Yes")
      attributes[:has_football_team] = row["IC2012.NCAA/NAIA member for football"].to_s.include?("Yes")
      attributes[:football_conference] = row["IC2012.NCAA/NAIA conference number football"].strip if attributes[:has_football_team]
      attributes[:has_basketball_team] = row["IC2012.NCAA/NAIA member for basketball"].to_s.include?("Yes")
      attributes[:basketball_conference] = row["IC2012.NCAA/NAIA conference number basketball"].strip if attributes[:has_basketball_team]
      attributes[:mission_statement] = row["IC2012MISSION.Mission statement"].strip if row["IC2012MISSION.Mission statement"].present?
      attributes[:mission_statement_url] = row["IC2012MISSION.Mission statement URL (if mission statement not provided)"].strip if row["IC2012MISSION.Mission statement URL (if mission statement not provided)"].present?
      attributes[:enrollment_total] = row["EFEST2012.Estimated enrollment, total"].to_i if row["EFEST2012.Estimated enrollment, total"].present?
      attributes[:undergraduate_enrollment] = row["EFEST2012.Estimated undergraduate enrollment, total"].to_i if row["EFEST2012.Estimated undergraduate enrollment, total"].present?
      attributes
    end
  end

  def address?
    attributes[:street_address] && attributes[:city] && attributes[:postal_code] && attributes[:state_code]
  end

  def calculate_secondary_school_rank_requirement(value)
    return "Not reported" if value == "Do not know" || !value.present?
    value
  end

end