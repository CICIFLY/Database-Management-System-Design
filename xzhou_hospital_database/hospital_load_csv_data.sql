-- hospital_load_csv_data.sql

-- insert rows of data from a csv file into relevant db tables
.separator '|'
.import patient.csv patient
.import staff.csv staff
.import doctor.csv doctor
.import nurse.csv nurse
.import receptionist.csv receptionist
.import accountant.csv accountant
.import bill.csv bill
.import patient_symtom.csv patient_symtom

