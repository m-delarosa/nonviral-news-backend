require 'rest-client'
# require 'pry'

Article.destroy_all

# Article.create(
#     source: "Google",
#     source_url: "www.google.com",
#     url_image: "https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/02/galaxy-s20-ultra-multitasking.jpg?itok=-wSx3YJh",
#     author: "Edgar Allen Poe",
#     title: "Do you keep apps open in the background or close them?",
#     description: "Let's have a chat with the AC forums. In the Android space, there are some questions that will be debated until the end of time. Should you charge your phone overnight? Is wired or wireless charging better? Do you keep your phone on silent or have the ringer …",
#     published_date: "2020-03-17T12:38:53Z"
#     )

response = RestClient.get(
    "http://newsapi.org/v2/everything?q=from=2020-03-23&to=2020-03-21&apiKey=33d9acb0b508450cb16344a38197e3e7")
 
    result = JSON.parse(response)
    
    result['articles'].each do |article|

     Article.create(
     source: article['source']['name'],
     source_url: article['url'],
     url_image: article['urlToImage'],
     author: article['author'],
     title: article['title'],
     description: article['description'],
     published_date: article['publishedAt'][/[^T]+/]
     )
 end
