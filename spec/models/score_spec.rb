require 'spec_helper'

describe Score do
  describe 'associations' do
    before(:each) do
      @owner = Person.create!(name: 'Jannette')
      @dog = Dog.create!(name: 'spot', breed: 'dalmatian', owner_id: @owner.id)
      @judge = Person.create!(name: 'Fredrick')

      @score = Score.create!(judge_id: @judge.id, contestant_id: @dog.id)
    end

    it "returns the dog that was scored" do
      expect(@score.dog).to eq @dog
    end

    it "returns the judge that did the scoring" do
      expect(@score.judge).to eq @judge
    end
  end
end
