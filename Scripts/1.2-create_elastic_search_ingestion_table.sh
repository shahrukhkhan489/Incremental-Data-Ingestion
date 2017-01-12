#!/bin/bash

cat > ~/createtablequery.hql <<EOF

ADD JAR /opt/elastic-search/elasticsearch-hadoop-5.1.1/packages/elasticsearch-hadoop-5.1.1.jar;
ADD JAR /usr/hdp/2.4.3.0-227/hive/lib/commons-httpclient-3.0.1.jar;

DROP TABLE ingestion;

CREATE EXTERNAL TABLE ingestion (
state                   char(2),
cms_certification_number_ccn    int,
provider_name           string,
address                 string,
city                    string,
zip                     int,
phone                   string,
type_of_ownership       string,
offers_nursing_care_services    string,
offers_physical_therapy_services        string,
offers_occupational_therapy_services    string,
offers_speech_pathology_services        string,
offers_medical_social_services  string,
offers_home_health_aide_services        string,
date_certified          string,
quality_of_patient_care_star_rating     string,
footnote_quality_of_patient_care_star_rating    string,
how_often_the_home_health_team_began_their_patients_care_in_a_timely_manner     string,
footnote_for_how_often_the_home_health_team_began_their_patients_care_in_a_timely_manner        string,
how_often_the_home_health_team_taught_patients_or_their_family_caregivers_about_their_drugs     string,
footnote_for_how_often_the_home_health_team_taught_patients_or_their_family_caregivers_about_their_drugs        string,
how_often_the_home_health_team_checked_patients_risk_of_falling string,
footnote_for_how_often_the_home_health_team_checked_patients_risk_of_falling    string,
how_often_the_home_health_team_checked_patients_for_depression  string,
footnote_for_how_often_the_home_health_team_checked_patients_for_depression     string,
how_often_the_home_health_team_made_sure_that_their_patients_have_received_a_flu_shot_for_the_current_flu_season        string,
footnote_for_how_often_the_home_health_team_made_sure_that_their_patients_have_received_a_flu_shot_for_the_current_flu_season   string,
how_often_the_home_health_team_made_sure_that_their_patients_have_received_a_pneumococcal_vaccine_pneumonia_shot        string,
footnote_as_how_often_the_home_health_team_made_sure_that_their_patients_have_received_a_pneumococcal_vaccine_pneumonia_shot    string,
with_diabetes_how_often_the_home_health_team_got_doctors_orders_gave_foot_care_and_taught_patients_about_foot_care      string,
footnote_for_how_often_the_home_health_team_got_doctors_orders_gave_foot_care_and_taught_patients_about_foot_care       string,
how_often_the_home_health_team_checked_patients_for_pain        string,
footnote_for_how_often_the_home_health_team_checked_patients_for_pain   string,
how_often_the_home_health_team_treated_their_patients_pain      string,
footnote_for_often_the_home_health_team_treated_their_patients_pain     string,
how_often_the_home_health_team_treated_heart_failure_weakening_of_the_heart_patients_symptoms   string,
footnote_for_how_often_the_home_health_team_treated_heart_failure_weakening_of_the_heart_patients_symptoms      string,
how_often_the_home_health_team_took_doctorordered_action_to_prevent_pressure_sores_bed_sores    string,
footnote_for_how_often_the_home_health_team_took_doctorordered_action_to_prevent_pressure_sores_bed_sores       string,
how_often_the_home_health_team_included_treatments_to_prevent_pressure_sores_bed_sores_in_the_plan_of_care      string,
footnote_for_how_often_the_home_health_team_included_treatments_to_prevent_pressure_sores_bed_sores_in_the_plan_of_care string,
how_often_the_home_health_team_checked_patients_for_the_risk_of_developing_pressure_sores_bed_sores     string,
footnote_for_how_often_the_home_health_team_checked_patients_for_the_risk_of_developing_pressure_sores_bed_sores        string,
how_often_patients_got_better_at_walking_or_moving_around       string,
footnote_for_how_often_patients_got_better_at_walking_or_moving_around  string,
how_often_patients_got_better_at_getting_in_and_out_of_bed      string,
footnote_for_how_often_patients_got_better_at_getting_in_and_out_of_bed string,
how_often_patients_got_better_at_bathing        string,
footnote_for_how_often_patients_got_better_at_bathing   string,
how_often_patients_had_less_pain_when_moving_around     string,
footnote_for_how_often_patients_had_less_pain_when_moving_around        string,
how_often_patients_breathing_improved   string,
footnote_for_how_often_patients_breathing_improved      string,
how_often_patients_wounds_improved_or_healed_after_an_operation string,
footnote_for_how_often_patients_wounds_improved_or_healed_after_an_operation    string,
how_often_patients_got_better_at_taking_their_drugs_correctly_by_mouth  string,
footnote_for_how_often_patients_got_better_at_taking_their_drugs_correctly_by_mouth     string,
how_often_home_health_patients_had_to_be_admitted_to_the_hospital       string,
footnote_for_how_often_home_health_patients_had_to_be_admitted_to_the_hospital  string,
how_often_patients_receiving_home_health_care_needed_urgent_unplanned_care_in_the_er_without_being_admitted     string,
footnote_for_how_often_patients_receiving_home_health_care_needed_urgent_unplanned_care_in_the_er_without_being_admitted        string,
how_often_home_health_patients_who_have_had_a_recent_hospital_stay_had_to_be_readmitted_to_the_hospital string,
footnote_for_how_often_home_health_patients_who_have_had_a_recent_hospital_stay_had_to_be_readmitted_to_the_hospital    string,
how_often_home_health_patients_who_have_had_a_recent_hospital   string,
footnote_for_how_often_home_health_patients_who_have_had_a_recent_hospital      string,
Footnote string)
STORED BY 'org.elasticsearch.hadoop.hive.EsStorageHandler'
TBLPROPERTIES('es.resource' = 'medicaldata/ingestion');
EOF
hive -f ~/createtablequery.hql;
rm -rf ~/createtablequery.hql;

