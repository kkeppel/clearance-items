class Item < ActiveRecord::Base
  require 'csv'

  ### Associations ###

  belongs_to :size
  belongs_to :color
  belongs_to :status
  belongs_to :style
  has_one :type, through: :style


  ### Class Methods ###

  def self.import(file)
    items = []
    spreadsheet = open_spreadsheet(file)
    CSV.foreach(file.path, headers: true) do |row|
      raise "Item ID #{row['item_id']} is invalid. Item IDs can only be numbers." if row["item_id"] =~ /\D/
      item = Item.find row["item_id"]
      item.status_id = Status.clearanced_id
      item.date_sold = Time.now
      if %w{pants dress}.include?(item.type.name)
        raise "Pants and dresses cannot be sold for less than $5" if Item.discount_price(item) < 5
      else
        raise "Items cannot be sold for less than $2" if Item.discount_price(item) < 2
      end
      item.price_sold = Item.discount_price(item)
      item.save!
      items << item
    end
    return items
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then CSV.new(file.path)
      else raise "You have tried to upload a #{File.extname(file.original_filename)} file. Please only upload .csv files."
    end
  end

  def self.discount_price(item)
    item.wholesale_price * 0.75
  end


  ### Instance Methods ###

  def wholesale_price
    style.wholesale_price
  end

  def status_name
    status.name
  end

end

