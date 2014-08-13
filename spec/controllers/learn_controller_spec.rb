require 'rails_helper'

RSpec.describe LearnController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET next" do
    it "returns http success" do
      get :next
      expect(response).to be_success
    end
  end

end
