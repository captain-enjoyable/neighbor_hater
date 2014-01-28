class GeocodingService
  attr :address
  attr :lat_long
  attr :location_data

  def initialize (address)
    @address = address
  end

  def self.run (address)
    self.new(address).create_location_data
  end

  def create_location_data
    @lat_long = parse_lat_long(create_request_object(address))
    @normalized_address = parse_normalized_address(create_request_object(@lat_long['lat'].to_s + "," + @lat_long['lng'].to_s))
    {
      'lat_long' => @lat_long,
      'normalized_address' => @normalized_address
    }
  end

  def parse_lat_long(request_object)
    request_object.first.data['geometry']['location']
  end

  def parse_normalized_address(request_object)
    request_object.first.data['formatted_address']
  end

  def create_request_object(query)
    Geocoder.search(query)
  end
end