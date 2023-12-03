employee_name_location = employee_name.merge(employee_location, how='left', left_on="person_id", right_on="employee_id")

employee_name_location = employee_name_location.sort_values(by=['first_name'])

employee_name_location[['first_name', 'last_name', 'state']]