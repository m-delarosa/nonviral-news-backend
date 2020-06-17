class ArticlesController < ApplicationController

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
            pandemic_test = article['description'].downcase.include? "pandemic"
            quarantine_test = article['description'].downcase.include? "quarantine"
            quarantining_test = article['description'].downcase.include? "quarantining"
            social_distance_test = article['description'].downcase.include? "social distance"
            social_distancing_test = article['description'].downcase.include? "social distancing"
            lockdown_test = article['description'].downcase.include? "lockdown"
            shut_down_test = article['description'].downcase.include? "shut down"
            shutdown_test = article['description'].downcase.include? "shutdown"
            unemployment_test = article['description'].downcase.include? "unemployment"
            n95_test = article['description'].downcase.include? "n95"
            difficult_times_test = article['description'].downcase.include? "difficult times"
            a_test = article['description'].downcase.include? "<a>"
            ol_test = article['description'].downcase.include? "<ol>"
            li_test = article['description'].downcase.include? "<li>"
            close_test = article['description'].downcase.include? "close"
            reschedule_test = article['description'].downcase.include? "reschedule"

            #Title Tests
            corona_test_title = article['title'].downcase.include? "corona"
            coronavirus_test_title = article['title'].downcase.include? "coronavirus"
            covid_test_title = article['title'].downcase.include? "covid-19"
            pandemic_test_title = article['title'].downcase.include? "pandemic"
            quarantine_test_title = article['title'].downcase.include? "quarantine"
            quarantining_test_title = article['title'].downcase.include? "quarantining"
            social_distance_test_title = article['title'].downcase.include? "social distance"
            social_distancing_test_title = article['title'].downcase.include? "social distancing"
            lockdown_test_title = article['title'].downcase.include? "lockdown"
            shut_down_test_title = article['title'].downcase.include? "shut down"
            shutdown_test_title = article['title'].downcase.include? "shutdown"
            unemployment_test_title = article['title'].downcase.include? "unemployment"
            n95_test_tile = article['title'].downcase.include? "n95"
            difficult_times_test_title = article['title'].downcase.include? "difficult times"
            reschedule_title_test = article['description'].downcase.include? "reschedule"            

            #Source Tests
            espanol_test = article['source']['name'].include? "Elespanol.com"
            indian_express_test = article['source']['name'].include? "Indianexpress.com"
            livedoor_test = article['source']['name'].include? "Livedoor.jp"

            
            !corona_test &&
            !coronavirus_test &&
            !covid_test &&
            !corona_test_title &&
            !coronavirus_test_title &&
            !covid_test_title &&
            article['urlToImage'] && 
            !pandemic_test && 
            !quarantine_test && 
            !espanol_test && 
            !quarantining_test &&
            !pandemic_test_title &&
            !quarantine_test_title &&
            !social_distance_test_title &&
            !social_distancing_test_title &&
            !lockdown_test_title &&
            !social_distance_test &&
            !social_distancing_test &&
            !lockdown_test &&
            !indian_express_test &&
            !livedoor_test &&
            !shut_down_test &&
            !shutdown_test &&
            !unemployment_test &&
            !shut_down_test_title &&
            !shutdown_test_title &&
            !unemployment_test_title &&
            !n95_test &&
            !n95_test_tile &&
            !difficult_times_test &&
            !difficult_times_test_title &&
            !a_test &&
            !ol_test &&
            !li_test &&
            !close_test &&
            !reschedule_test &&
            !reschedule_title_test
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
