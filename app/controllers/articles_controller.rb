class ArticlesController < ApplicationController
    # def index
    #     @articles = Article.all
    #     render json: @articles
    # end

    def index
        two_days_ago = (Date.today - 2).iso8601

        response = RestClient.get(
        "http://newsapi.org/v2/everything?q=from=#{Date.today}&to=#{two_days_ago}&language=en&pageSize=20&apiKey=33d9acb0b508450cb16344a38197e3e7")
        
        result = JSON.parse(response)

        articles = result['articles'].select do |article| 
            corona_test = article['description'].downcase.include? "corona"
            coronavirus_test = article['description'].downcase.include? "coronavirus"
            covid_test = article['description'].downcase.include? "covid-19"
    
            corona_test_title = article['title'].downcase.include? "corona"
            coronavirus_test_title = article['title'].downcase.include? "coronavirus"
            covid_test_title = article['title'].downcase.include? "covid-19"
            pandemic_test = article['title'].downcase.include? "pandemic"
            quarantine_test = article['title'].downcase.include? "quarantine"
            espanol_test = article['source']['name'].include? "Elespanol.com"
            quarantining_test = article['title'].downcase.include? "quarantining"

            
    
            !corona_test && !coronavirus_test && !covid_test && !corona_test_title && !coronavirus_test_title && !covid_test_title && article['urlToImage'] && !pandemic_test && !quarantine_test && !espanol_test && !quarantining_test
        end

        formatted_articles = articles.map do |article|
            {source: article['source']['name'],
            source_url: article['url'],
            url_image: article['urlToImage'],
            author: article['author'],
            title: article['title'].titlecase,
            description: article['description'],
            published_date: article['publishedAt'][/[^T]+/]}
        end

        render json: formatted_articles
        # byebug
        # Tests
        # def test 
        # corona_test = article['description'].downcase.include? "corona"
        # coronavirus_test = article['description'].downcase.include? "coronavirus"
        # covid_test = article['description'].downcase.include? "covid-19"

        # corona_test_title = article['title'].downcase.include? "corona"
        # coronavirus_test_title = article['title'].downcase.include? "coronavirus"
        # covid_test_title = article['title'].downcase.include? "covid-19"
        # end

        # result['articles'].select do { |article| test }
    end



end
