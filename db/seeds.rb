
user = User.create!(
    [{
         email: 'bello@efluxz.com',
         password: '12345678',
         password_confirmation: '12345678',
         first_name: 'Ola',
         last_name: 'Bello',
         role: 0
     }, {
        email: 'tutu@efluxz.com',
        password: '12345678',
        password_confirmation: '12345678',
        first_name: 'Tutu',
        last_name: 'Adigwe',
        role: 0
    }, {
        email: 'dewunmi@efluxz.com',
        password: '12345678',
        password_confirmation: '12345678',
        first_name: 'Dewunmi',
        last_name: 'Adebowale',
        role: 0
    }, {
        email: 'dania@efluxz.com',
        password: '12345678',
        password_confirmation: '12345678',
        first_name: 'OJ',
        last_name: 'Dania',
        role: 1
    }, {
        email: 'david@efluxz.com',
        password: '12345678',
        password_confirmation: '12345678',
        first_name: 'David',
        last_name: 'Umoh',
        role: 1
    }]
)

comedian = Comedian.create!(
    [{ name: "Baseketmouth"},
               {name: "Whalemouth"},
               {name: "I Go Dye"},
               {name: "Akpororo}"},
                {name: "AYLIVE"}])

publisher = Publisher.create([
               {publisher_name: "AYLIVE"},
               {publisher_name: "Basketmouth"},
               {publisher_name: "Ajebo"},
               {publisher_name: "Akpororo"},
               {publisher_name: "Whalemouth"},
               {publisher_name: "Arewa"}
                             ])

category = Category.create([
           {category_name: "Standup Comedy"},
           {category_name: "Arewa"},
           {category_name: "Comedy Skits"},
           {category_name: "Standup Comedy"},
                           ])

video = Video.create!([
          {
              title: "Movie1",
              description: "Laugh out loud",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "http://s3.amazonaws.com/contentcataloguefile/videos/images/000/000/031/medium/AYLive.jpg",
              category: category.first,
              comedian: comedian.first,
              publisher: publisher.first
          },

          {
              title: "Movie2",
              description: "Laugh out loud2",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "http://s3.amazonaws.com/contentcataloguefile/videos/images/000/000/031/medium/AYLive.jpg",
              category: category.last,
              comedian: comedian.last,
              publisher: publisher.last
          },

          {
              title: "IPOB fight",
              description: "Fighting in IPOB",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "http://s3.amazonaws.com/contentcataloguefile/videos/images/000/000/031/medium/AYLive.jpg",
              category: category.last,
              comedian: comedian.last,
              publisher: publisher.last
          },

          {
              title: "Anambra fight",
              description: "Governor laughs at people",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "http://s3.amazonaws.com/contentcataloguefile/videos/images/000/000/031/medium/AYLive.jpg",
              category: category[2],
              comedian: comedian[2],
              publisher: publisher[2]
          },

          {
              title: "Abuja chairman",
              description: "Laugh out loud",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "http://s3.amazonaws.com/contentcataloguefile/videos/images/000/000/031/medium/AYLive.jpg",
              category: category.first,
              comedian: comedian.first,
              publisher: publisher.first
          },
          {
              title: "Ogusbaba laughs at people",
              description: "Chairman is laughing",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "http://s3.amazonaws.com/contentcataloguefile/videos/images/000/000/031/medium/AYLive.jpg",
              category: category[2],
              comedian: comedian[2],
              publisher: publisher[2]
          }
      ])

