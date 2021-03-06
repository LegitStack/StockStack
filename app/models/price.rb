class Price < ActiveRecord::Base

  #has_one :price
  #belongs_to :price
  #has_and_belongs_to_many :prices

def self.to_csv
  CSV.generate do |csv|
    csv << column_names
    all.each do |rec|
      csv << rec.attributes.values_at(*column_names)
    end
  end
end

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    record = find_by_id(row["id"]) || new
    parameters = ActionController::Parameters.new(row.to_hash)
    record.update(parameters.permit(:id, :ticker, :when, :high, :low, :open, :close, :other, :updated_at, :created_at))
    record.save!
  end
end


end
