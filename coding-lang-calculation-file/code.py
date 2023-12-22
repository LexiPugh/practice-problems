employee_name_location = employee_name.merge(employee_location, how='left', left_on="person_id", right_on="employee_id")

employee_name_location = employee_name_location.sort_values(by=['first_name'])

employee_name_location[['first_name', 'last_name', 'state']]


big_gdp = big_gdp[big_gdp.gdp_per_million > 10000000]

big_gdp = big_gdp.sort_values(by=['country'])

big_gdp[['country']]


shopping_cart['percentage'] = ((shopping_cart['purchased_items'] / shopping_cart['carted_items']) * 100).round(2)

shopping_cart = shopping_cart.sort_values(by='customer_id', ascending=False)

shopping_cart[['customer_id', 'percentage']]


max_order = orders['number_of_orders'].max()

orders = orders[(orders.number_of_orders == max_order)]

orders


group = emails.groupby(['email']).count().reset_index().rename(columns={'id': 'email_count'})

filter = group[group['email_count'] > 1]

emails = filter.sort_values(by='email')

emails[['email', 'email_count']]


def factorial(n):
  factorial = 1
  for i in range(1, n+1):
    factorial = factorial * i
  return factorial


customers = customers[(customers['purchased_items'] == 'M&Ms') | (customers['purchased_items'] == 'Snickers') | (customers['purchased_items'] == 'Twizzlers')]

customers[['customer_id']]


patients = patients[(patients['age'] > 50) & (patients['cholesterol'] >= 240) & (patients['weight'] >= 200)]

patients = patients.sort_values(by='cholesterol', ascending=False)

patients


transactions = transactions[transactions['bill_total'] > 500]

transactions = transactions['customer_id'].nunique()

transactions


ice_cream = ice_cream[ice_cream['community_rating'] > ice_cream['official_rating']]

ice_cream = ice_cream.sort_values(by='flavor')

ice_cream[['flavor']]


first_three_letters = gamer_tags['first_name'].str[:3]

year_of_birth = gamer_tags['birth_date'].str.split('/').str[2]

gamer_tags['gamer_tag'] = first_three_letters + year_of_birth

gamer_tags = gamer_tags.sort_values(by='gamer_tag')

gamer_tags[['first_name', 'last_name', 'gamer_tag']]


country = country[(country['population'] > 50000000) & (country['population'] < 100000000)]

country = country.sort_values(by='population', ascending=True)

country[['country', 'population']]


stores = stores.groupby('store_id').mean().round(2).reset_index()

stores = stores[stores['revenue'] > 1000000]

stores = stores.sort_values(by='store_id')

stores[['store_id', 'revenue']]