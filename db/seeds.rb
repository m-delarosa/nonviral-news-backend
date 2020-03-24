# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all

Article.create(
    source: "Google",
    source_url: "www.google.com",
    url_image: "https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/02/galaxy-s20-ultra-multitasking.jpg?itok=-wSx3YJh",
    author: "Edgar Allen Poe",
    title: "Do you keep apps open in the background or close them?",
    description: "Let's have a chat with the AC forums. In the Android space, there are some questions that will be debated until the end of time. Should you charge your phone overnight? Is wired or wireless charging better? Do you keep your phone on silent or have the ringer …",
    published_date: "2020-03-17T12:38:53Z"
    )