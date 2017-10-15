require 'spec_helper'

describe Dog do
  describe 'associations' do
    before(:each) do
      @owner = Person.create!(name: 'Shaelyn')
      @dog = Dog.create!(name: 'Wiley', breed: 'German Shepard', owner_id: @owner.id)

      @judge_1 = Person.create!(name: 'Kennith')
      @judge_2 = Person.create!(name: 'Farouk')

      @score_1 = Score.create!(score: 9, contestant_id: @dog.id, judge_id: @judge_1.id)
      @score_2 = Score.create!(score: 7, contestant_id: @dog.id, judge_id: @judge_2.id)
    end

    it "returns the person who owns it" do
      expect(@dog.owner).to eq @owner
    end

    it "returns scores in which it was scored" do
      expect(@dog.scores).to match_array [@score_1, @score_2]
    end

    it "returns the people who have judged it" do
      expect(@dog.scorers).to match_array [@judge_1, @judge_2]
    end
  end
end
