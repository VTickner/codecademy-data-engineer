import pandas as pd

ad_clicks = pd.read_csv('ad_clicks.csv')

# 1. View first few rows of ad_clicks
print(ad_clicks.head(10))

# 2. How many views came from each utm_source?
ad_clicks_by_source = ad_clicks.groupby('utm_source').user_id.count().reset_index()
print(ad_clicks_by_source)
# email = 255, facebook = 504, google = 680, twitter = 215

# 3. Add column is_click, set True if ad_click_timestamp is not null, otherwise False
# ~ is a NOT operator
ad_clicks['is_click'] = ~ad_clicks.ad_click_timestamp.isnull()
print(ad_clicks.head(10))

# 4. Add column clicks_by_source
clicks_by_source = ad_clicks.groupby(['utm_source', 'is_click']).user_id.count().reset_index()
print(clicks_by_source)

# 5. Pivot clicks_by_source
clicks_pivot = clicks_by_source.pivot(
  columns='is_click',
  index='utm_source',
  values='user_id'
).reset_index()
print(clicks_pivot)

# 6. Add column percent_clicked in pivot table
clicks_pivot['percent_clicked'] = round((clicks_pivot[True] / (clicks_pivot[False] + clicks_pivot[True]) * 100), 1)
print(clicks_pivot)

# 7. Were approxiamtely the same number of people shown both ads?
ad_ab = ad_clicks.groupby('experimental_group').user_id.count().reset_index()
print(ad_ab)
# Yes, A = 827, B = 827

# 8. Using is_click check if a greater percentage of users clicked ad A or B
ad_ab_clicks = ad_clicks.groupby(['experimental_group', 'is_click']).user_id.count().reset_index()
ad_ab_clicks_pivot = ad_ab_clicks.pivot(
  columns='is_click',
  index='experimental_group',
  values='user_id'
).reset_index()
ad_ab_clicks_pivot['percent_clicked'] = round((ad_ab_clicks_pivot[True] / (ad_ab_clicks_pivot[False] + ad_ab_clicks_pivot[True]) * 100), 1)
print(ad_ab_clicks_pivot)
# A = 37.5%, B = 30.8%

# 9. Create a_clicks and b_clicks to contain only results for A and B respectively
a_clicks = ad_clicks[ad_clicks.experimental_group == 'A']
b_clicks = ad_clicks[ad_clicks.experimental_group == 'B']
print(a_clicks.head(10))
print(b_clicks.head(10))

# 10. For each ad group, calculate the percent of users who clicked on the ad by day
a_clicks_grouped = a_clicks.groupby(['is_click', 'day']).user_id.count().reset_index()
a_clicks_grouped['percent_clicked'] = round((a_clicks_grouped['user_id'] / a_clicks_grouped.groupby('day')['user_id'].transform('sum') * 100),1)
a_clicks_pivot = a_clicks_grouped.pivot(
    columns='day',
    index='is_click',
    values='percent_clicked'
).reset_index()

b_clicks_grouped = b_clicks.groupby(['is_click', 'day']).user_id.count().reset_index()
b_clicks_grouped['percent_clicked'] = round((
    b_clicks_grouped['user_id'] / b_clicks_grouped.groupby('day')['user_id'].transform('sum') * 100
), 1)
b_clicks_pivot = b_clicks_grouped.pivot(
    columns='day',
    index='is_click',
    values='percent_clicked'
).reset_index()

# 11. Compare the results for A and B. What happened over the course of the week
print(a_clicks_pivot)
# Mon = 38.1, Tues = 36.1, Wed = 30.6, Thur = 40.5, Fri = 39.8, Sat = 38.1, Sun = 39.4
print(b_clicks_pivot)
# Mon = 28.3, Tues = 17,8, Wed = 28.2, Thur = 25.0, Fri = 29.7, Sat = 15.6, Sun = 31.2
# Ad B consistently received lower percentage of clicks per views than Ad A for every single day, therefore I would recommend Ad A be used.