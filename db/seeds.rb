# require 'rest-client'
# # require 'pry'
# require 'date'

# Article.destroy_all

# Article.create(
#     source: "Google",
#     source_url: "www.google.com",
#     url_image: "https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/02/galaxy-s20-ultra-multitasking.jpg?itok=-wSx3YJh",
#     author: "Edgar Allen Poe",
#     title: "Do you keep apps open in the background or close them?",
#     description: "Let's have a chat with the AC forums. In the Android space, there are some questions that will be debated until the end of time. Should you charge your phone overnight? Is wired or wireless charging better? Do you keep your phone on silent or have the ringer …",
#     published_date: "2020-03-17T12:38:53Z"
#     )


# two_days_ago = (Date.today - 2).iso8601

# response = RestClient.get(
#     "http://newsapi.org/v2/everything?q=from=#{Date.today}&to=#{two_days_ago}&language=en&pageSize=20&apiKey=33d9acb0b508450cb16344a38197e3e7")
 
#     result = JSON.parse(response)
    
#     result['articles'].each do |article|

#     corona_test = article['description'].downcase.include? "corona"
#     coronavirus_test = article['description'].downcase.include? "coronavirus"
#     covid_test = article['description'].downcase.include? "covid-19"

#     corona_test_title = article['title'].downcase.include? "corona"
#     coronavirus_test_title = article['title'].downcase.include? "coronavirus"
#     covid_test_title = article['title'].downcase.include? "covid-19"
    
# if !corona_test && !coronavirus_test && !covid_test && !corona_test_title && !coronavirus_test_title && !covid_test_title && article['urlToImage']

#         Article.create(
#             source: article['source']['name'],
#             source_url: article['url'],
#             url_image: article['urlToImage'],
#             author: article['author'],
#             title: article['title'].titlecase,
#             description: article['description'],
#             published_date: article['publishedAt'][/[^T]+/]
#             )
#     end
#  end
