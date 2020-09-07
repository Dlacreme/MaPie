require "./spec_helper"

conf = Mapie::PieConfig.load_from("./demo/mapie.yml")

describe "Mapie::PieConfig" do
  it "parse a pie file" do
    conf.name.should eq("Mapie Demo")
  end

  it "can interpret Mapie idioms" do
    conf.interpret_idioms
  end
end

describe "Mapie::TaskRunner" do
  begin
    Dir.delete("./.mapie")
  rescue
  end
  task_runner = Mapie::TaskRunner.new conf

  it "create migration" do
    task_runner.create_migrations
  end
end
