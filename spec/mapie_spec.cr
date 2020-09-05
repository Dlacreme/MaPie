require "./spec_helper"

describe Mapie do
  conf = Mapie::PieConfig.load_from("./demo/mapie.yml")

  it "parse a pie file" do
    conf.name.should eq("Mapie Demo")
  end

  it "can interpret Mapie idioms" do
    conf.interpret_idioms
  end

  it "create migration" do
    conf.create_migrations
  end
end
