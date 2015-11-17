require "rails_helper"

describe User do
  let(:valid_attributes) {
    {
      first_name: "Cthulhu",
      last_name: "Fhtagn",
      email: "cthulhu@example.com"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

  end
end
