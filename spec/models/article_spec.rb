require 'rails_helper'

RSpec.describe Article, type: :model do

  describe '#validations' do

    subject { build(:article) }

    it { should enumerize(:status).in(
                    Article::STATUS_NEW,
                    Article::STATUS_ON_MODERATION,
                    Article::STATUS_FOR_REVISION,
                    Article::STATUS_ACTIVE,
                    Article::STATUS_FROZEN).with_default(Article::STATUS_NEW) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:announce) }
    it { should validate_length_of(:announce).is_at_least(Article::ANNOUNCE_LENGTH_MIN).is_at_most(Article::ANNOUNCE_LENGTH_MAX) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(Article::CONTENT_LENGTH_MIN)}

    it 'should be valid' do
      article = build(:article)
      expect(article).to be_valid
      article.attributes = {announce: nil, content: nil}
      article.valid?
      expect(article.errors.size).to eq(2)
      expect(build(:published_article)).to be_valid
    end

    it '#validates_presence_of :published_at' do
      article = build(:published_article)
      article.published_at = nil
      expect(article).not_to be_valid
    end

  end

end
