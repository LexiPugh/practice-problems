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


chocolate_items = bakery_items[bakery_items['product_name'].str.contains("Chocolate")]

chocolate_items


customers = customers[(customers['age'] > 65) | (customers['total_purchase'] > 200)]

customers['age'].count()


bikes = bikes[bikes['miles'] >= 10000]

bikes['miles'].count()


revenue = revenue.groupby('store_id').mean('revenue_millions').reset_index()

revenue = revenue.sort_values(by='revenue_millions', ascending=False)

revenue[['store_id', 'revenue_millions']]


students = students[(students['grade'] == 'A') | (students['grade'] == 'B')]

students = students.sort_values(by=['first_name', 'last_name'], ascending=[True, True])

students[['first_name', 'last_name']]


web_traffic = web_traffic.groupby('date_visited').nunique().reset_index()

web_traffic = web_traffic.sort_values(by='date_visited', ascending=True)

web_traffic


football = football[(football['points_scored'] > 400) & (football['penalties'] <= 80)]

football[['team']]


import pandas as pd

animals_main = pd.concat([animals_main, animals_secondary])

animals_main = animals_main.sort_values(by='animal', ascending=True)

animals_main


import pandas as pd

bread_table['key'] = 1

meat_table['key'] = 1

result = pd.merge(bread_table, meat_table, on ='key').drop("key", axis=1) 

result = result.sort_values(by=['bread_name', 'meat_name'], ascending=[True, True])

result[['bread_name', 'meat_name']]


transactions = transactions.drop_duplicates(subset=['customer_id'])

transactions = transactions.sort_values(by='customer_id', ascending=True)

transactions[['customer_id']]


uber_income = uber_income[(uber_income['income'] <= 10000) | (uber_income['income'] > 65000)]

uber_income = uber_income.sort_values(by='income', ascending=False)

uber_income


employee_info = employee_info[(employee_info['end_of_year_review_rating'] <= 5) & ((employee_info['tasks_completed']/employee_info['tasks_assigned']) < 0.75)]

employee_info = employee_info.sort_values(by='name', ascending=True)

employee_info[['name']]


companies['market_capitalization'] = (companies['share_price'] * companies['shares_outstanding']).round(2)

companies = companies.sort_values(by='market_capitalization', ascending=False)

companies[['company_name', 'stock_symbol', 'market_capitalization']]


boss = boss.merge(boss[['employee_id', 'employee_name']], left_on='boss_id', right_on='employee_id', how='left')

boss = boss.sort_values(by='employee_name_x', ascending=True)

boss[['employee_name_x', 'employee_name_y']]


sessions = sessions[sessions['activity'] == 'Gaming']

sessions = sessions.groupby('user_id')['minutes_per_session'].mean().reset_index()

sessions


member_percentage = (((customers['has_member_card']).count() / (customers['kroger_id']).count()) * 100).round(2)

member_percentage


big_pharma['money_lost'] = (big_pharma['money_made'] - big_pharma['money_spent']).abs().round(1)

big_pharma = big_pharma[(big_pharma['money_made'] - big_pharma['money_spent']) < 0]

big_pharma = big_pharma.sort_values(by='money_lost', ascending=False)

big_pharma.head(3)


gmail_users = gmail_users[gmail_users['email'].str.contains('@gmail\.com$')]

gmail_users.sort_values(by='customer_id', ascending=True)

gmail_users[['customer_id', 'name', 'email']]


linkedin_posts['popularity_score'] = (linkedin_posts['actions'] / linkedin_posts['impressions']) * 100

linkedin_posts = linkedin_posts[linkedin_posts['popularity_score'] > 1]

linkedin_posts = linkedin_posts.sort_values(by='popularity_score', ascending=False)

linkedin_posts[['post_id', 'popularity_score']]


n = int(input().strip())
if (n % 2) == 1:
    print('Weird')
elif (n >= 2) and (n <= 5):
    print('Not Weird')
elif (n >=6) and (n <= 20):
    print('Weird')
else:
    print('Not Weird')


a = int(input())
b = int(input())
print(a + b)
print(a - b)
print(a * b)


a = int(input())
b = int(input())
print(a//b)
print(a/b)


n = int(input())
i = 0
while i < n:
    print(i**2)
    i+=1


import pandas as pd

def combine_two_tables(person: pd.DataFrame, address: pd.DataFrame) -> pd.DataFrame:
    
    combined_table = pd.merge(person, address, on='personId', how='left')

    return combined_table[['firstName', 'lastName', 'city', 'state']]