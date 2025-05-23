# 전체 조회
select * from clinic_tb;

# department_tb에 값 넣기 
insert into department_tb(department_name)
select 				
	department
from
	clinic_tb
group by
	department
order by					
	department;
    
# treatment_tb에 값 넣기 
insert into treatment_tb(tratment_name)
select 				
	treatment
from
	clinic_tb
group by
	treatment
order by					
	treatment;
    
# patient_tb에 값 넣기
insert into patient_tb(patient_name, patient_gender, patient_birth)
select
	patient_name,
    gender,
    birth_date
from 
	clinic_tb
group by
	patient_name,
    gender,
    birth_date
order by
	patient_name;
    
# doctor_tb에 값 넣기

    