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


patients = patients[(patients['age'] > 50) & (patients['cholesterol'] >= 240) & (patients['weight'] >= 200)]

patients = patients.sort_values(by='cholesterol', ascending=False)

patients


transactions = transactions[transactions['bill_total'] > 500]

transactions = transactions['customer_id'].nunique()

transactions


customers = customers[(customers['purchased_items'] == 'M&Ms') | (customers['purchased_items'] == 'Snickers') | (customers['purchased_items'] == 'Twizzlers')]

customers[['customer_id']]


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


countries = countries[(countries['square_kilometers'] >= 3000000) | (countries['population'] >= 100000000)]

countries = countries.sort_values(by='country', ascending=True)

countries[['country', 'square_kilometers', 'population']]


youtube_videos['like_ratio'] = (youtube_videos['thumbs_up'] / (youtube_videos['thumbs_up'] + youtube_videos['thumbs_down']) * 100)

youtube_videos = youtube_videos[(youtube_videos['like_ratio'] < 55)]

youtube_videos = youtube_videos.sort_values(by='video_id', ascending=True)

youtube_videos[['video_id']]


devices = devices[devices['game'] == 'League of Legends']

devices = devices.groupby('device_id').min().reset_index()

devices = devices.sort_values(by='date_played', ascending=False)

devices[['device_id', 'date_played']]


tesla_models['profit'] = (tesla_models['car_price'] - tesla_models['production_cost']) * tesla_models['cars_sold']

tesla_models = tesla_models.sort_values(by = 'profit', ascending = False)

tesla_models.head(1)


products['profit'] = ((products['sales_price'] - products['purchase_price']) * 0.93).round(2)

products = products.sort_values(['profit', 'product_name'], ascending=[False, True])

products[['product_name', 'profit']]


import pandas as pd

employees['birth_date'] = pd.to_datetime(employees['birth_date'])

employees = employees.sort_values(by='birth_date', ascending=True)

employees[['employee_id']].head(3)


phone_numbers = (phone_numbers[phone_numbers['numbers'].str[:3] == '701'])

phone_numbers


restaurant_reviews['comment_count'] = restaurant_reviews.groupby('restaurant')['comment'].transform('count')

restaurant_reviews['avg_rating'] = restaurant_reviews.groupby('restaurant')['rating'].transform('mean')

restaurant_reviews = restaurant_reviews.sort_values(by=['comment_count', 'avg_rating'], ascending=[False, False])

restaurant_reviews[['restaurant', 'comment_count', 'avg_rating']].head(1)


ratings['rating_difference'] = abs(ratings['tomato_rating'] - ratings['user_rating'])

ratings = ratings.sort_values(by='rating_difference', ascending=False)

ratings.head(1)


inspections = inspections[inspections['minor_issues'] <= 3]

inspections = inspections[inspections['critical_issues'] < 1]

inspections = inspections.sort_values(by='owner_name')

inspections[['owner_name', 'vehicle']]


classes = classes.groupby(['class'])['grade'].mean().reset_index(name='average_grade')

classes = classes.sort_values(by='average_grade', ascending=False)

classes


homes = homes[(homes['year'] >= 2012) & (homes['year'] <= 2017)]

homes[['address']]


sales = sales['lost_revenue_millions'].sum().round(0).astype(int)

sales


import numpy as np

players['skill_level'] = np.where(players['batting_average']>0.37, 'Great Hitter',
                         np.where(players['batting_average']<0.27, 'Below Average', 'Average'))

players


purchases = purchases['total_purchase'].groupby(purchases['gender']).mean().round(2).reset_index(name='avg_purchase_price')

purchases.sort_values(by='gender', ascending=True)

purchases


patients['BMI'] = ((patients['weight_pounds'] / (patients['height_inches']**2)) * 703).round(1)

patients = patients[patients['BMI'] > 30]

patients[['patient_id', 'BMI']]


candidates = candidates[(candidates['problem_solving'] == 'X') & 
             (candidates['sql_experience'] == 'X') & 
             (candidates['domain_knowledge'] == 'X') & 
             ((candidates['python'] == 'X') | (candidates['r_programming'] == 'X'))]

candidates[['candidate_id']]