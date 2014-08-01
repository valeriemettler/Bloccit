describe Vote do

  describe "validations" do
    describe "value validation" do

  it "only allows -1 as values" do
        vote = Vote.new(value: -1)
        vote.should be_valid
      end

 it "only allows 1 as values" do
        vote = Vote.new(value: 1)
        vote.should be_valid
      end

 it "does not allows 0 as values" do
        vote = Vote.new(value: 0)
        vote.should_not be_valid
      end

    end
  end
end