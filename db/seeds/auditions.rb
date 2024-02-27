#Auditions
audition_address = Address.create!(address1: "", address2: nil, address3: nil, city: "", state: "IL", country: "US", postal_code: "60201")
show_address = Address.create!(address1: "", address2: nil, address3: nil, city: "", state: "IL", country: "US", postal_code: "60201")
audition = Audition.create!(name_of_company: "",  union_status: "Non-Equity", pay_scale: "", name_of_show: "", written_by: "", director: nil, musical_director: nil, choreographer: nil, rehearsal_startdate: "2024-08-23", tech_startdate: nil, previews_startdate: nil, show_startdate: "2024-10-13", show_enddate: "2024-10-28", show_address_id: nil, show_warnings: "", show_description: "", additional_notes: nil, audition_date1: "2024-08-20", audition_time1: nil, audition_date2: "2024-08-21", audition_time2: nil, audition_date3: nil, audition_time3: nil, audition_date4: nil, audition_time4: nil, audition_date5: nil, audition_time5: nil, callback_date1: nil, callback_time1: nil, callback_date2: nil, callback_time2: nil, callback_date3: nil, callback_time3: nil, in_the_room: nil, materials_to_prepare: "", how_to_submit: "")

Character.create!(audition_id: audition.id, name: "", age: "", gender: "", ethnicity: "Any/Open", description: "", skills: "", notes: nil)
  

