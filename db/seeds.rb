# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

toons = [
    {
        name: 'Spongebob',
        age: 36,
        enjoys_doing: 'Jellyfishing, Frycooking, Hanging out with friends.',
        image: "https://img.buzzfeed.com/buzzfeed-static/static/2021-10/19/21/campaign_images/4074bc53837b/nickelodeon-tweeted-that-spongebob-is-a-member-of-2-527-1634679537-4_dblbig.jpg?resize=1200:*"
    },
    {
        name: 'Sandy',
        age: 37,
        enjoys_doing: 'Karate, Science, Extreme sports, Rodeo, Inventing and building.',
        image: "https://i.ytimg.com/vi/bL-xJNKLdTY/maxresdefault.jpg"
    },
    {
        name: 'Goku',
        age: 24,
        enjoys_doing: 'Training, Combat, Challenging strong opponents, Sleeping, Eating.',
        image: "https://staticg.sportskeeda.com/editor/2022/12/6cfeb-16705684919250-1920.jpg"
    },
    {
        name: 'Bulma',
        age: 27,
        enjoys_doing: 'Science, Inventing, Yelling, Hairstyling.',
        image: "https://assets.mycast.io/actor_images/actor-bulma-briefs-360013_large.jpg?1644215137"
    }
    
]

toons.each do |toon|
    Toon.create toon
    puts "creating toon #{toon}"
end