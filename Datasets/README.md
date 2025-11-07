<img width="1016" height="251" alt="Screenshot 2025-10-23 at 15 11 37" src="https://github.com/user-attachments/assets/122fedb5-ba92-4017-8efd-26da1c668002" />

Some of the data cleaning was done in Pandas 


I changed the data so that all values are in the same case.  
<img width="382" height="303" alt="cust_name " src="https://github.com/user-attachments/assets/455e9e5c-e3fc-4644-8d0f-fb7d81a478c6" />  

Date where a mix of different formats so I used to formulas to convert the data to the dateime type and that change the values to the correct date. 
<img width="327" height="375" alt="date_unclean" src="https://github.com/user-attachments/assets/8fd6d3b3-7f20-47ac-936b-e5ffdf5a9376" />  
<img width="560" height="149" alt="date_formulas" src="https://github.com/user-attachments/assets/17dfa422-7042-48f2-97c5-d6cbe4a441a4" />  
<img width="157" height="285" alt="date_clean" src="https://github.com/user-attachments/assets/e3c1ff5c-3fe5-4ca0-8d1b-a488608a9bdf" />  

Deleted duplicates.  
<img width="665" height="293" alt="duplicates" src="https://github.com/user-attachments/assets/cfa5e759-fe3c-46af-b1d3-87b8076fd4b0" />  
<img width="665" height="293" alt="Duplicate_delete" src="https://github.com/user-attachments/assets/cf5c4bfd-db90-4b1f-a9ec-dc66b70de178" />

The quantities were a float type so i had to tye them to an Integer to remove to decimal.  
<img width="291" height="221" alt="quantity_unclean" src="https://github.com/user-attachments/assets/0f217b6b-b23c-4b24-974d-4bf33d3c7502" />
<img width="542" height="136" alt="quantity_formula " src="https://github.com/user-attachments/assets/75fb07bf-13c2-479e-8b8b-dac358d468fa" />
<img width="290" height="248" alt="quantity_clean" src="https://github.com/user-attachments/assets/f2545227-9928-4ff9-ae48-082d2ed58b25" />

I identified the missing ID numbers and added them back, since they are the primary keys. I used the reference images to find and verify the missing IDs.  
<img width="453" height="192" alt="id_missing numbers_1" src="https://github.com/user-attachments/assets/25fedb14-39a4-4417-94de-c0d0e53e35b6" />  
<img width="517" height="201" alt="id_missing numbers_2" src="https://github.com/user-attachments/assets/0ddc3fba-173c-4a69-be68-32b82d6a67bb" />   
<img width="637" height="262" alt="id_missing numbers_3" src="https://github.com/user-attachments/assets/134e2a4a-316c-4437-a09b-9042c2e27171" />
<img width="513" height="190" alt="id_missing numbers_4" src="https://github.com/user-attachments/assets/a09b9344-d171-4202-9963-96bee626f4f0" />

After cleaning the table, the following images show the data before and after the process.  
<img width="700" height="182" alt="table_unclean" src="https://github.com/user-attachments/assets/e7449518-fcbb-4546-afbf-587e22f5340e" />  
<img width="653" height="182" alt="table_clean" src="https://github.com/user-attachments/assets/22c0f27b-c359-4c6a-bcec-8d541a893dfc" />


