require 'Date'
RSpec.describe Station do
  describe "validations" do
    it "can exist with valid attributes" do
      station = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)

      expect(station.name).to eq("Turing")
      expect(station.city).to eq("Hell")
      expect(station.installation_date).to eq(Date.parse("1969/4/20"))
      expect(station.dock_count).to eq(69)
      expect(Station.count).to eq(1)
    end
  end

  describe "in-validations" do
    it "will not created without a name" do
      station = Station.create(city: "Hell", installation_date: "1969/4/20", dock_count: 69)

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end

    it "will not be created without city" do
      station = Station.create(name: "Turing", installation_date: "1969/4/20", dock_count: 69)

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end

    it "will not be created without installation_date" do
      station = Station.create(name: "Turing", city: "Hell", dock_count: 69)

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end

    it "will not be created without dock_count" do
      station = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20")

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end
  end

  describe "Class Methods" do
		it "Gets the latest date for most recent installation date" do
			Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

			expect(Station.most_recent_installation_date).to eq(Date.parse("2015/10/10"))
		end

    it "Gets the earliest date for most recent installation date" do
			Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.oldest_installation_date).to eq(Date.parse("1960/1/2"))
    end

    it "Gets the earliest date for most recent installation date" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.oldest_station).to eq(station_three)

    end

    it "Gets the earliest date for most recent installation date" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.newest_station).to eq(station_four)
    end

    it "Gets average bikes availble per station" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.average_bikes_available_per_station).to eq(179)
    end

    it "Gets maximum dock count" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.maximum_dock_count).to eq(413)
    end

    it "Gets minimum dock count" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.minimum_dock_count).to eq(13)
    end

    it "Gets maximum dock count station" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.station_with_maximum_dock_count.first).to eq(station_two)
    end

    it "Gets minimum dock count station" do
			station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
			station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)
			station_three = Station.create(name: "Bible", city: "Denver", installation_date: "1960/1/2", dock_count: 221)
			station_four  = Station.create(name: "Chatfield", city: "Jefferson County", installation_date: "2015/10/10", dock_count: 13)

      expect(Station.station_with_minimum_dock_count.first).to eq(station_four)
    end
	end
end
