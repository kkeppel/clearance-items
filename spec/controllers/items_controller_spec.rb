require "spec_helper"
require "rails_helper"

describe ItemsController do
  describe "POST #import" do
    let(:file) { Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/passing.csv") }
    it "redirects to the home page" do
      post :import, file: file
      expect(response).to redirect_to root_url
    end

    it "adds a flash notice" do
      post :import, file: file
      expect(flash[:notice]).to eq "CSV was successfully imported."
    end

  end
end