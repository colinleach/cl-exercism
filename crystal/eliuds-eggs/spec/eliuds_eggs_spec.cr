require "spec"
require "../src/*"

describe "EliudsEggs" do
  it "0 eggs" do
    EliudsEggs.egg_count(0).should eq(0)
  end

  it "1 egg" do
    EliudsEggs.egg_count(16).should eq(1)
  end

  it "4 eggs" do
    EliudsEggs.egg_count(89).should eq(4)
  end

  it "13 eggs" do
    EliudsEggs.egg_count(2000000000).should eq(13)
  end
end
