require 'spec_helper'

describe Person do
  describe 'associations' do
    before(:each) do
      @person = Person.create!(name: 'Shaelyn')
      @other_person = Person.create!(name: 'Caetlin')
      @judge_1 = Person.create!(name: 'Kennith')
      @judge_2 = Person.create!(name: 'Farouk')

      @owned_dog_1 = Dog.create!(owner_id: @person.id)
      @owned_dog_2 = Dog.create!(owner_id: @person.id)
      @judged_dog  = Dog.create!(owner_id: @other_person.id)

      @rating_given = Score.create!(contestant_id: @judged_dog.id, judge_id: @person.id)
      @rating_recieved_1 = Score.create!(contestant_id: @owned_dog_1.id, judge_id: @judge_1.id)
      @rating_recieved_2 = Score.create!(contestant_id: @owned_dog_2.id, judge_id: @judge_2.id)
    end

    it "returns the dogs it owns" do
      expect(@person.owned_dogs).to match_array [@owned_dog_1, @owned_dog_2]
    end

    it "returns the scores that it gave to dogs" do
      expect(@person.judgings).to match_array [@rating_given]
    end

    it "returns the dogs it judged" do
      expect(@person.judged_dogs).to match_array [@judged_dog]
    end

    it "returns the scores in which a dog it owned was scored" do
      expect(@person.scores).to match_array [@rating_recieved_1, @rating_recieved_2]
    end

    it "returns the people who rated a dog it owned" do
      expect(@person.judges).to match_array [@judge_1, @judge_2]
    end

    it "returns the owners of the dogs it judged" do
      expect(@person.judged_owners).to match_array [@other_person]
    end
  end
end
