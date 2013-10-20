require "spec_helper"

describe School do
  it { should have_attribute :ipeds_id }
  it { should have_attribute :as_of_year }
  it { should have_attribute :name }
  it { should have_attribute :street_address }
  it { should have_attribute :city }
  it { should have_attribute :postal_code }
  it { should have_attribute :state_code }
  it { should have_attribute :general_phone_number }
  it { should have_attribute :general_fax_number }
  it { should have_attribute :longitude }
  it { should have_attribute :latitude }
  it { should have_attribute :open_to_the_general_public }
  it { should have_attribute :level_of_institution }
  it { should have_attribute :highest_level_of_offering }
  it { should have_attribute :undergraduate_offering }
  it { should have_attribute :highest_degree_offered }
  it { should have_attribute :financial_aid_url }
  it { should have_attribute :admissions_url }
  it { should have_attribute :online_application_url }
  it { should have_attribute :net_price_calculator_url }
  it { should have_attribute :status }
  it { should have_attribute :occupational }
  it { should have_attribute :academic }
  it { should have_attribute :religous_affiliation }
  it { should have_attribute :associates_degree }
  it { should have_attribute :bachelors_degree }
  it { should have_attribute :open_admissions }
  it { should have_attribute :secondary_school_gpa_requirement }
  it { should have_attribute :secondary_school_rank_requirement }
  it { should have_attribute :secondary_school_record_requirement }
  it { should have_attribute :recommendations_requirement }
  it { should have_attribute :formal_demonstration_of_competencies_requirement }
  it { should have_attribute :admission_test_score_requirement }
  it { should have_attribute :applicants }
  it { should have_attribute :admissions }
  it { should have_attribute :sat_reading_25th_percentile }
  it { should have_attribute :sat_reading_75th_percentile }
  it { should have_attribute :sat_math_25th_percentile }
  it { should have_attribute :sat_math_75th_percentile }
  it { should have_attribute :sat_writing_25th_percentile }
  it { should have_attribute :sat_writing_75th_percentile }
  it { should have_attribute :act_composite_25th_percentile }
  it { should have_attribute :act_composite_75th_percentile }
  it { should have_attribute :act_english_25th_percentile }
  it { should have_attribute :act_english_75th_percentile }
  it { should have_attribute :act_math_25th_percentile }
  it { should have_attribute :act_math_75th_percentile }
  it { should have_attribute :act_writing_25th_percentile }
  it { should have_attribute :act_writing_75th_percentile }

  it { should have_attribute :dual_credit }
  it { should have_attribute :life_experience_credit }
  it { should have_attribute :all_remote }
  it { should have_attribute :study_abroad }
  it { should have_attribute :evenings_and_weekends }
  it { should have_attribute :calendar_system }
  it { should have_attribute :tuition_payment_plan }
  it { should have_attribute :undergraduate_application_fee }
  it { should have_attribute :on_campus_housing }
  it { should have_attribute :total_price_in_state_on_campus }
  it { should have_attribute :total_price_out_of_state_on_campus }
  it { should have_attribute :undergraduate_out_of_state_tuition_average }
  it { should have_attribute :undergraduate_in_state_tuition }
  it { should have_attribute :undergraduate_books_and_supplies }
  it { should have_attribute :undergraduate_on_campus_room_and_board }
  it { should have_attribute :undergraduate_percent_receiving_financial_aid }
  it { should have_attribute :undergraduate_average_financial_aid }
  it { should have_attribute :member_of_ncaa }
  it { should have_attribute :member_of_naia }
  it { should have_attribute :has_football_team }
  it { should have_attribute :football_conference }
  it { should have_attribute :has_basketball_team }
  it { should have_attribute :basketball_conference }
  it { should have_attribute :mission_statement }
  it { should have_attribute :mission_statement_url }
  it { should have_attribute :enrollment_total }
  it { should have_attribute :undergraduate_enrollment }

  it { should validate_presence_of :ipeds_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :as_of_year }
  it { should validate_numericality_of(:total_price_in_state_on_campus).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:total_price_out_of_state_on_campus).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :postal_code }
  it { should validate_presence_of :state_code }
  it { should validate_presence_of :general_phone_number }
  it { should validate_presence_of :highest_level_of_offering }
  it { should validate_presence_of :undergraduate_offering }
  it { should validate_presence_of :highest_degree_offered }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :status }
  it { should ensure_booleanness_of :occupational }
  it { should ensure_booleanness_of :open_to_the_general_public }
  it { should ensure_booleanness_of :academic }
  it { should ensure_booleanness_of :associates_degree }
  it { should ensure_booleanness_of :bachelors_degree }
  it { should ensure_booleanness_of :open_admissions }
  it { should validate_numericality_of(:applicants).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:admissions).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sat_reading_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sat_reading_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sat_math_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sat_math_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sat_writing_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:sat_writing_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_composite_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_composite_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_english_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_english_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_math_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_math_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_writing_25th_percentile).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:act_writing_75th_percentile).is_greater_than_or_equal_to(0) }
  it { should ensure_booleanness_of :dual_credit }
  it { should ensure_booleanness_of :life_experience_credit }
  it { should ensure_booleanness_of :all_remote }
  it { should ensure_booleanness_of :study_abroad }
  it { should ensure_booleanness_of :evenings_and_weekends }
  it { should ensure_booleanness_of :tuition_payment_plan }
  it { should validate_numericality_of(:undergraduate_application_fee).is_greater_than_or_equal_to(0) }
  it { should ensure_booleanness_of :on_campus_housing }
  it { should validate_numericality_of(:undergraduate_out_of_state_tuition_average).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:undergraduate_in_state_tuition).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:undergraduate_books_and_supplies).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:undergraduate_on_campus_room_and_board).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:undergraduate_percent_receiving_financial_aid).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:undergraduate_average_financial_aid).is_greater_than_or_equal_to(0) }
  it { should ensure_booleanness_of :member_of_ncaa }
  it { should ensure_booleanness_of :member_of_naia }
  it { should ensure_booleanness_of :has_football_team }
  it { should ensure_booleanness_of :has_basketball_team }
  it { should validate_numericality_of(:enrollment_total).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:undergraduate_enrollment).is_greater_than_or_equal_to(0) }
end