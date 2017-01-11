#!/bin/bash

cat > ~/recreate_elasticsearch_base_table.hql <<EOF
ADD JAR /opt/elastic-search/elasticsearch-hadoop-5.1.1/packages/elasticsearch-hadoop-5.1.1.jar;
ADD JAR /usr/hdp/2.4.3.0-227/hive/lib/commons-httpclient-3.0.1.jar;

INSERT OVERWRITE TABLE ingestion SELECT State, CMS_Certification_Number_CCN,  Provider_Name, Address, City, Zip, Phone, Type_of_Ownership, Offers_Nursing_Care_Services, Offers_Physical_Therapy_Services, Offers_Occupational_Therapy_Services, Offers_Speech_Pathology_Services, Offers_Medical_Social_Services, Offers_Home_Health_Aide_Services, Date_Certified, Quality_of_Patient_Care_Star_Rating, Footnote_Quality_of_Patient_Care_Star_Rating, How_often_the_home_health_team_began_their_patients_care_in_a_timely_manner, Footnote_for_how_often_the_home_health_team_began_their_patients_care_in_a_timely_manner, How_often_the_home_health_team_taught_patients_or_their_family_caregivers_about_their_drugs, Footnote_for_how_often_the_home_health_team_taught_patients_or_their_family_caregivers_about_their_drugs, How_often_the_home_health_team_checked_patients_risk_of_falling, Footnote_for_how_often_the_home_health_team_checked_patients_risk_of_falling, How_often_the_home_health_team_checked_patients_for_depression, Footnote_for_how_often_the_home_health_team_checked_patients_for_depression, How_often_the_home_health_team_made_sure_that_their_patients_have_received_a_flu_shot_for_the_current_flu_season, Footnote_for_how_often_the_home_health_team_made_sure_that_their_patients_have_received_a_flu_shot_for_the_current_flu_season, How_often_the_home_health_team_made_sure_that_their_patients_have_received_a_pneumococcal_vaccine_pneumonia_shot,  Footnote_as_how_often_the_home_health_team_made_sure_that_their_patients_have_received_a_pneumococcal_vaccine_pneumonia_shot,  With_diabetes_how_often_the_home_health_team_got_doctors_orders_gave_foot_care_and_taught_patients_about_foot_care, Footnote_for_how_often_the_home_health_team_got_doctors_orders_gave_foot_care_and_taught_patients_about_foot_care, How_often_the_home_health_team_checked_patients_for_pain, Footnote_for_how_often_the_home_health_team_checked_patients_for_pain, How_often_the_home_health_team_treated_their_patients_pain, Footnote_for_often_the_home_health_team_treated_their_patients_pain, How_often_the_home_health_team_treated_heart_failure_weakening_of_the_heart_patients_symptoms, Footnote_for_how_often_the_home_health_team_treated_heart_failure_weakening_of_the_heart_patients_symptoms, How_often_the_home_health_team_took_doctorordered_action_to_prevent_pressure_sores_bed_sores,   Footnote_for_how_often_the_home_health_team_took_doctorordered_action_to_prevent_pressure_sores_bed_sores,  How_often_the_home_health_team_included_treatments_to_prevent_pressure_sores_bed_sores_in_the_plan_of_care, Footnote_for_how_often_the_home_health_team_included_treatments_to_prevent_pressure_sores_bed_sores_in_the_plan_of_care, How_often_the_home_health_team_checked_patients_for_the_risk_of_developing_pressure_sores_bed_sores, Footnote_for_how_often_the_home_health_team_checked_patients_for_the_risk_of_developing_pressure_sores_bed_sores, How_often_patients_got_better_at_walking_or_moving_around, Footnote_for_how_often_patients_got_better_at_walking_or_moving_around, How_often_patients_got_better_at_getting_in_and_out_of_bed, Footnote_for_how_often_patients_got_better_at_getting_in_and_out_of_bed, How_often_patients_got_better_at_bathing, Footnote_for_how_often_patients_got_better_at_bathing, How_often_patients_had_less_pain_when_moving_around, Footnote_for_how_often_patients_had_less_pain_when_moving_around, How_often_patients_breathing_improved, Footnote_for_how_often_patients_breathing_improved, How_often_patients_wounds_improved_or_healed_after_an_operation, Footnote_for_how_often_patients_wounds_improved_or_healed_after_an_operation, How_often_patients_got_better_at_taking_their_drugs_correctly_by_mouth, Footnote_for_how_often_patients_got_better_at_taking_their_drugs_correctly_by_mouth, How_often_home_health_patients_had_to_be_admitted_to_the_hospital, Footnote_for_how_often_home_health_patients_had_to_be_admitted_to_the_hospital, How_often_patients_receiving_home_health_care_needed_urgent_unplanned_care_in_the_ER_without_being_admitted, Footnote_for_how_often_patients_receiving_home_health_care_needed_urgent_unplanned_care_in_the_ER_without_being_admitted, How_often_home_health_patients_who_have_had_a_recent_hospital_stay_had_to_be_readmitted_to_the_hospital, Footnote_for_how_often_home_health_patients_who_have_had_a_recent_hospital_stay_had_to_be_readmitted_to_the_hospital, How_often_home_health_patients_who_have_had_a_recent_hospital, Footnote_for_how_often_home_health_patients_who_have_had_a_recent_hospital, Footnote FROM incremental_table;

EOF

hive -f ~/recreate_elasticsearch_base_table.hql;
rm -rf ~/recreate_elasticsearch_base_table.hql;