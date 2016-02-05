FactoryGirl.define do
  factory :article do
    user
    title { Faker::Hipster.sentence }
    announce do
      content = Faker::Hipster.paragraph(6, true, 1)
      while content.size < Article::ANNOUNCE_LENGTH_MIN
        content += Faker::Hipster.paragraph(1)
      end
      content.truncate(Article::ANNOUNCE_LENGTH_MAX)
    end
    content do
      content = Faker::Hipster.paragraph(12, true, 5)
      while content.size < Article::CONTENT_LENGTH_MIN
        content += Faker::Hipster.paragraph(1)
      end
      content
    end

    factory :published_article do
      is_published { true }
      published_at { Time.now - rand(60*24*30*12).hours }
    end

  end

end
