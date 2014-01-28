require "spec_helper"

describe Comment do
  describe ".most_recent_first" do
    it "returns more recent comments first" do
      first = Comment.create!(headline: "headline", body: "body")
      last  = Comment.create!(headline: "headline", body: "body")

      Comment.most_recent_first.should == [last, first]
    end
  end
end