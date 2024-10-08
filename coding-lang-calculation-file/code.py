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


import pandas as pd

def duplicate_emails(person: pd.DataFrame) -> pd.DataFrame:

    return person[person.duplicated('email') == True][['email']].drop_duplicates()


import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:

    customers = customers[~customers['id'].isin(orders['customerId'])]

    customers = customers.rename(columns={'name': 'Customers'})

    return customers[['Customers']]


import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:

    world = world[(world['area'] >= 3000000) | (world['population'] >= 25000000)]

    return world[['name', 'population', 'area']]


import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:

    views = views[views['author_id'] == views['viewer_id']]

    views = views['author_id'].unique()

    result = pd.DataFrame({'id': views})

    result = result.sort_values(by='id', ascending=True)

    return result


import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:

    users['name'] = users['name'].str.capitalize()

    return users[['user_id', 'name']].sort_values(by='user_id', ascending=True)


import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:

    users['name'] = users['name'].str[:1].str.upper() + users['name'].str[1:].str.lower()

    return users[['user_id', 'name']].sort_values(by='user_id', ascending=True)


import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    
    tweets = tweets[tweets['content'].str.len() > 15]

    return tweets[['tweet_id']]


import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:

    products = products[(products['low_fats'] == 'Y') & (products['recyclable'] == 'Y')]

    return products[['product_id']]


import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:

    employees['bonus'] = 0

    employees.loc[(employees['employee_id'] % 2 == 1) & (~employees['name'].str.startswith('M')), 'bonus'] = employees['salary']
    
    return employees[['employee_id', 'bonus']].sort_values(by='employee_id', ascending=True)


import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:

    combined_df = employee.merge(bonus, how='outer')

    combined_df = combined_df[(combined_df['bonus'] < 1000) | (combined_df['bonus'].isna())]

    return combined_df[['name', 'bonus']]


import pandas as pd

def find_customer_referee(customer: pd.DataFrame) -> pd.DataFrame:

    customer = customer[(customer['referee_id'] != 2) | (customer['referee_id'].isna())]

    return customer[['name']]


import pandas as pd

def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    
    activity = activity.groupby('player_id')[['event_date']].min().reset_index().rename(columns={'event_date':'first_login'})

    return activity


import pandas as pd

def not_boring_movies(cinema: pd.DataFrame) -> pd.DataFrame:

    cinema = cinema[(cinema['id'] % 2 == 1) & (cinema['description'] != 'boring')]

    return cinema.sort_values(by='rating', ascending=False)


import pandas as pd

def swap_salary(salary: pd.DataFrame) -> pd.DataFrame:
    
    salary['sex'] = salary['sex'].replace({'m': 'f', 'f': 'm'})
    
    return salary


import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:

    combined_df = sales.merge(product, how='inner')

    return combined_df[['product_name', 'year', 'price']]


import pandas as pd

def replace_employee_id(employees: pd.DataFrame, employee_uni: pd.DataFrame) -> pd.DataFrame:

    combined_df = employees.merge(employee_uni, how='left')

    return combined_df[['unique_id', 'name']]


import pandas as pd

def account_summary(users: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:

    combined_df = users.merge(transactions, how='inner')

    balance_df = combined_df.groupby('account')[['amount']].sum().reset_index().rename(columns={'amount' : 'balance'})

    result_df = combined_df.merge(balance_df, on='account', how='left')

    result_df = result_df[result_df['balance'] > 10000]

    return result_df[['name', 'balance']].drop_duplicates()


laptops['storage_type'] = laptops['laptop_name'].apply(lambda x: 'SSD' if 'SSD' in x else 'HDD')

laptops.sort_values(by='laptop_id', ascending=True)

laptops


food_regions = food_regions.groupby('region')['fast_food_millions'].sum().reset_index()

food_regions = food_regions.sort_values(by='fast_food_millions', ascending=False)

food_regions[['region']].head(1)


global_debts = global_debts[global_debts['year'] == global_debts['year'].max()]

global_debts['national_debt'] = global_debts['national_debt'].round(0)

global_debts = global_debts.sort_values(by='national_debt', ascending=False)

global_debts[['country', 'national_debt']].head(3)


responses['response'] = responses['response'].replace({'Yes': 'Y', 'No': 'N'})

responses


combined_df = customers.merge(date_viewed, how='inner')

combined_df = combined_df.groupby('name')['movie_id'].count().reset_index()

combined_df = combined_df.sort_values(by='movie_id', ascending=False)

combined_df[['name']].head(1)


tech_layoffs['pct_employees_fired'] = ((tech_layoffs['employees_fired'] / tech_layoffs['company_size']) * 100).round(2)

tech_layoffs = tech_layoffs.sort_values(by='company', ascending=True)

tech_layoffs[['company', 'pct_employees_fired']]


football_attendance = football_attendance.groupby('year_played')['season_attendance'].sum().reset_index()

football_attendance = football_attendance.sort_values(by='season_attendance', ascending=False)

football_attendance.head(1)


pollution = pollution.groupby('pollutant')['concentration'].mean().round(2).reset_index()

pollution = pollution[pollution['concentration'] > 0.5]

pollution = pollution.sort_values(by='pollutant', ascending=True)

pollution


combined_df = user_time.merge(users, how='inner')

combined_df = combined_df[combined_df['media_time_minutes'] > combined_df['media_time_minutes'].mean()]

combined_df[['first_name']].sort_values(by='first_name', ascending=True)


import pandas as pd

import datetime

replace_date = (datetime.datetime(2023, 1, 1) - datetime.timedelta(days=5*365))

computer_replacement['date_activated'] = pd.to_datetime(computer_replacement['date_activated'])

computer_replacement = computer_replacement[computer_replacement['date_activated'] < replace_date]

computer_replacement[['computer_id']]


customers['first_name'] = customers['full_name'].str.split(" ").str[0]

customers[['customer_id', 'first_name']]


orders = orders[orders['pizza_order'] == 'Pepperoni']

savings = (orders['pizza_order'].count()) * (0.5 * 0.5)

print(savings)


bad_data['first_name'] = bad_data['id'].str[5:]

bad_data['id'] = bad_data['id'].str[:5]

bad_data[['id', 'first_name']]


grades['ranks'] = grades['grade'].rank(method='dense', ascending=False)

grades = grades.sort_values(by=['ranks', 'student_name'], ascending=[True, True])

grades


import pandas as pd

import datetime as dt

combined_df = users.merge(orders, how='inner', left_on='user_id', right_on='buyer_id')

combined_df['join_date'] = pd.to_datetime(combined_df['join_date'])

combined_df['order_date'] = pd.to_datetime(combined_df['order_date'])

combined_df = combined_df[(combined_df['join_date'].dt.year==2022) & (combined_df['order_date'].dt.year==2022)]

combined_df[['user_id']].sort_values(by='user_id', ascending=True)


employee = employee[~employee['employee_id'].isin(bonus['emp_id'])]

employee[['employee_id', 'name']].sort_values(by='employee_id', ascending=True)


purchases = purchases.groupby('customer_id')['product_id'].nunique().reset_index()

purchases = purchases[purchases['product_id'] == 4]

purchases[['customer_id']]


import pandas as pd

import datetime as dt

employee_turnover['date_left'] = pd.to_datetime(employee_turnover['date_left'])

employee_turnover['year_is_2022'] = employee_turnover['date_left'].dt.year.apply(lambda x: 1 if x == 2022 else None)

employee_turnover_pct = (employee_turnover['year_is_2022'].count() / employee_turnover['date_started'].count()) * 100

print(employee_turnover_pct)


greenhouse_gases = greenhouse_gases.groupby('country')['carbon_emissions_millions'].sum().round(1).reset_index().rename(columns={'carbon_emissions_millions':'total_emissions'})

greenhouse_gases = greenhouse_gases.sort_values(by='total_emissions', ascending=False).head(1)


def increase_amount(row):
  if row['pay_level'] == 1:
    return row['salary'] * 1.1
  elif row['pay_level'] == 2:
    return row['salary'] * 1.15
  else:
    return row['salary'] * 3

employees['new_salary'] = employees.apply(increase_amount, axis=1)

employees


cloud_storage['fees'] = (200 - cloud_storage['storage_used']).abs()

cloud_storage = cloud_storage[cloud_storage['storage_used'] > 200]

cloud_storage[['customer_id', 'fees']].sort_values(by='fees', ascending=False)


inventory = inventory[(inventory['bike_sold'] =='Y') & (~inventory['bike_price'].isna())]

average_sale_price = inventory['bike_price'].mean().round(2)

print(average_sale_price)


employee_raise['row_num'] = employee_raise.sort_values(by='salary', ascending=True).groupby('department').cumcount() + 1

employee_raise = employee_raise[employee_raise['row_num'] == 1]

employee_raise['new_salary'] = (employee_raise['salary'] * 1.15).round(2)

employee_raise[['employee_id', 'department', 'salary', 'new_salary']].sort_values(by='new_salary', ascending=False)


import pandas as pd

import datetime

current_date = datetime.datetime(2023, 1, 1)

customers['birth_date'] = pd.to_datetime(customers['birth_date'])

customers['age'] = (current_date - customers['birth_date']).dt.days / 365

customers = customers[customers['age'] >= 55]

customers[['customer_id']].sort_values(by='customer_id', ascending=True)


sum_purchases = purchases.groupby('customer_id')['order_total'].sum().reset_index(name='total_spending')

count_orders = purchases.groupby('customer_id')['order_total'].count().reset_index(name='order_count')

purchases = sum_purchases.merge(count_orders, how='outer')

purchases = purchases[(purchases['total_spending'] < 250) | (purchases['order_count'] <= 2)]

purchases[['customer_id']]


crew_spending = crew_spending.groupby('employee_id')['amount_spent'].sum().reset_index(name='total_amount_spent')

crew_spending['amount_owed'] = crew_spending['total_amount_spent'].apply(lambda x: x-100 if x > 100 else 0)

crew_spending = crew_spending.sort_values(by=['amount_owed', 'employee_id'], ascending=[False, True])

crew_spending[['employee_id', 'total_amount_spent', 'amount_owed']]


amazon_returns = amazon_returns.groupby('order_id').agg({'product_price': 'sum', 'estimated_return_price': 'sum'}).reset_index()

amazon_returns = amazon_returns[amazon_returns['product_price'] * 0.15 <= amazon_returns['estimated_return_price']]

amazon_returns[['order_id']]


import pandas as pd

import datetime

year_sub = datetime.datetime(2023, 1, 1) - datetime.timedelta(days= 3 * 365)

companies['year'] = pd.to_datetime(companies['year'])

companies = companies[companies['year'] >= year_sub]

companies = companies.groupby('company')['profit'].sum().reset_index()

companies = companies[companies['profit'] > 20000000]

companies[['company']].sort_values(by='company', ascending=True)


products['size_change_percentage'] = (((products['new_size'] / products['original_size'])*100)-100).round(0)

products['price_change_percentage'] = (((products['new_price'] / products['original_price'])*100)-100).round(0)

products['shrinkflation_flag'] = products.apply(lambda x: 'True' if (x['new_size'] < x['original_size']) & (x['new_price'] > x['original_price']) else 'False', axis=1)

products[['product_name', 'size_change_percentage', 'price_change_percentage', 'shrinkflation_flag']].sort_values(by='product_name', ascending=True)


heights = heights[heights['average_height'] > heights['average_height'].mean()]

heights = heights.sort_values(by='average_height', ascending=False)

heights


import pandas as pd

resolved_calls = help_desk_manager[help_desk_manager['call_outcome'] == 'Y'].groupby('employee_name')['call_outcome'].count().reset_index(name='resolved_calls')

total_calls = help_desk_manager.groupby('employee_name')['call_outcome'].count().reset_index(name='call_count')

combined_df = resolved_calls.merge(total_calls)

combined_df['pct_resolved'] = (combined_df['resolved_calls'] / combined_df['call_count']) * 100

combined_df[['employee_name', 'pct_resolved']].sort_values(by='employee_name', ascending=True)


import pandas as pd

import datetime 

profits['date'] = pd.to_datetime(profits['date'])

profits['month'] = profits['date'].dt.month

profits = profits.groupby('month')['profit'].sum().reset_index(name='total_profit')

profits = profits[(profits['month'] <= 6) & (profits['total_profit'] > 0)].sort_values(by='total_profit', ascending=False)


import pandas as pd

med_list = med_list.rename(columns={'medication_name': 'medication', 'recommended_dosage': 'rec_dosage'})

combined_df = pd.concat([medication_information, med_list])

combined_df = combined_df.sort_values(by='medication', ascending=True)

combined_df[['medication', 'rec_dosage']]


import pandas as pd

job_two = job_two.rename(columns={"employee_name":"name"})

combined_df = pd.concat([job_one, job_two])

combined_df = combined_df[combined_df['full_time'] == 'Y']

combined_df = combined_df.groupby('name')['full_time'].count().reset_index()

combined_df = combined_df[combined_df['full_time'] > 1]


sales2000 = calculators.apply(lambda x: x['calculator_sales'] if x['year'] == 2000 else 0, axis=1).sum()

sales2023 = calculators.apply(lambda x: x['calculator_sales'] if x['year'] == 2023 else 0, axis=1).sum()

calculators['pct_change'] = (((sales2023 - sales2000) / sales2000) * 100).round(2)

calculators[['pct_change']].drop_duplicates()


import pandas as pd

products2022 = products[products['year'] == 2022].groupby('company_name').size().reset_index(name='count_2022')

products2023 = products[products['year'] == 2023].groupby('company_name').size().reset_index(name='count_2023')

combined_df = pd.merge(products2022, products2023, how='outer')

combined_df = combined_df.fillna(0)

combined_df['difference'] = combined_df['count_2023'] - combined_df['count_2022']

combined_df[['company_name', 'difference']].sort_values(by='company_name', ascending=True)