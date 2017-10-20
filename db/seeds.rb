
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
               {name: "Akpororo"},
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
              video_storage_path: "https://s3-us-west-2.amazonaws.com/laffhubarchive/LaffHub+Videos/0001.+ASUBABA+SKITS/asubaba/2016-08-29/24014-LIES.mp4",
              category: category.first,
              comedian: comedian.first,
              publisher: publisher.first,
              image: File.open(File.join(Rails.root, "AYLIVE.jpg"))
          },

          {
              title: "Movie2",
              description: "Laugh out loud2",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "https://s3-us-west-2.amazonaws.com/laffhubarchive/LaffHub+Videos/0001.+ASUBABA+SKITS/asubaba/2016-08-29/24014-LIES.mp4",
              category: category.last,
              comedian: comedian.last,
              publisher: publisher.last,
              image: File.open(File.join(Rails.root, "AYLIVE.jpg"))
          },

          {
              title: "IPOB fight",
              description: "Fighting in IPOB",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "https://s3-us-west-2.amazonaws.com/laffhubarchive/LaffHub+Videos/0001.+ASUBABA+SKITS/asubaba/2016-08-29/24014-LIES.mp4",
              category: category.last,
              comedian: comedian.last,
              publisher: publisher.last,
              image: File.open(File.join(Rails.root, "AYLIVE.jpg"))
          },

          {
              title: "Anambra fight",
              description: "Governor laughs at people",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "https://s3-us-west-2.amazonaws.com/laffhubarchive/LaffHub+Videos/0001.+ASUBABA+SKITS/asubaba/2016-08-29/24014-LIES.mp4",
              category: category[2],
              comedian: comedian[2],
              publisher: publisher[2],
              image: File.open(File.join(Rails.root, "AYLIVE.jpg"))
          },

          {
              title: "Abuja chairman",
              description: "Laugh out loud",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "https://s3-us-west-2.amazonaws.com/laffhubarchive/LaffHub+Videos/0001.+ASUBABA+SKITS/asubaba/2016-08-29/24014-LIES.mp4",
              category: category.first,
              comedian: comedian.first,
              publisher: publisher.first,
              image: File.open(File.join(Rails.root, "AYLIVE.jpg"))
          },
          {
              title: "Ogusbaba laughs at people",
              description: "Chairman is laughing",
              release_date: "Tue, 05 Feb 2013",
              video_storage_path: "https://s3-us-west-2.amazonaws.com/laffhubarchive/LaffHub+Videos/0001.+ASUBABA+SKITS/asubaba/2016-08-29/24014-LIES.mp4",
              category: category[2],
              comedian: comedian[2],
              publisher: publisher[2],
              image: File.open(File.join(Rails.root, "AYLIVE.jpg"))
          }
      ])

# image: File.new("#{Rails.root}/app/assets/images/AYLIVE.jpg")