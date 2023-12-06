employee_name_location = employee_name.merge(employee_location, how='left', left_on="person_id", right_on="employee_id")

employee_name_location = employee_name_location.sort_values(by=['first_name'])

employee_name_location[['first_name', 'last_name', 'state']]


big_gdp = big_gdp[big_gdp.gdp_per_million > 10000000]

big_gdp = big_gdp.sort_values(by=['country'])

big_gdp[['country']]


shopping_cart['percentage'] = ((shopping_cart['purchased_items'] / shopping_cart['carted_items']) * 100).round(2)

shopping_cart = shopping_cart.sort_values(by='customer_id', ascending=False)

shopping_cart[['customer_id', 'percentage']]
