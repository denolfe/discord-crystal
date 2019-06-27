require "./spec_helper"

describe Bot::Registry do
  it "Registers inheriters" do
    Bot::Registry.commands.empty?.should be_false
  end

  it "Find command by name" do
    Bot::Registry.find("ping").should be_truthy
  end

  it "Find returns nil if no command found" do
    Bot::Registry.find("asdf").should be_falsey
  end
end
