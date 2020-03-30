class ArticlesController < ApplicationController
    # def index
    #     @articles = Article.all
    #     render json: @articles
    # end

    def index
        two_days_ago = (Date.today - 2).iso8601

        response = RestClient.get(
        "http://newsapi.org/v2/everything?apiKey=33d9acb0b508450cb16344a38197e3e7&q=from=#{Date.today.iso8601}&to=#{two_days_ago}&language=en&pageSize=100")
        
        result = JSON.parse(response)

        valid_articles = result['articles'].select {|article| article['title'] && article['description'] }

        coronafree_articles = valid_articles.select do |article|
            
            #Desciption Tests
            corona_test = article['description'].downcase.include? "corona"
            coronavirus_test = article['description'].downcase.include? "coronavirus"
            covid_test = article['description'].downcase.include? "covid-19"
    
            #Title Tests
            corona_test_title = article['title'].downcase.include? "corona"
            coronavirus_test_title = article['title'].downcase.include? "coronavirus"
            covid_test_title = article['title'].downcase.include? "covid-19"
            pandemic_test = article['title'].downcase.include? "pandemic"
            quarantine_test = article['title'].downcase.include? "quarantine"
            quarantining_test = article['title'].downcase.include? "quarantining"

            espanol_test = article['source']['name'].include? "Elespanol.com"


            !corona_test && !coronavirus_test && !covid_test && !corona_test_title && !coronavirus_test_title && !covid_test_title && article['urlToImage'] && !pandemic_test && !quarantine_test && !espanol_test && !quarantining_test
        end

        formatted_articles = coronafree_articles.map do |article|
            {source: article['source']['name'],
            source_url: article['url'],
            url_image: article['urlToImage'],
            author: article['author'],
            title: article['title'].titlecase,
            description: article['description'],
            published_date: article['publishedAt'][/[^T]+/]}
        end

        render json: formatted_articles

    end



end
