require "spec_helper"
require "rails_helper"

describe Item do
  describe "#import" do
    let(:passing_file) { Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/passing.csv") }

    it "can only upload .csv files" do
      file = Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/non_csv.xlsx")
      expect { Item.import(file) }.to raise_error(RuntimeError, /csv/)
    end

    it "can only import integers for item_id" do
      file = Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/string.csv")
      expect { Item.import(file) }.to raise_error(RuntimeError, /number/)
    end

    it "pants and dresses price_sold must be > $5" do
      file = Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/pants_and_dresses.csv")
      Item.stub(:discount_price).and_return(3)
      expect { Item.import(file) }.to raise_error(RuntimeError, /\$5/)
    end

    it "other items price_sold must be > $2" do
      file = Rack::Test::UploadedFile.new("#{Rails.root}/test/fixtures/files/other_types.csv")
      Item.stub(:discount_price).and_return(1)
      expect { Item.import(file) }.to raise_error(RuntimeError, /\$2/)
    end

    it "changes status to 'clearanced'" do
      item = Item.find 5
      item.status_id = Status.clearanced_id
      item.save
      Item.import(passing_file)
      saved_item = Item.find 5
      saved_item.status_name.should == "clearanced"
    end
    
  end

  describe "#discount_price" do
    it "is 75% of style.wholesale_price" do
      item = Item.first
      Item.discount_price(item).should == item.wholesale_price*0.75
    end
  end
end
