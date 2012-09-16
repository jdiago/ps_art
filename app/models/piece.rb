class Piece < ActiveRecord::Base
  attr_accessible :name, :lat, :lng, :gmaps, :address

  acts_as_gmappable :lat => 'lat', :lng => 'lng', :process_geocoding => :geocode?,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!address.blank? && (lat.blank? || lng.blank?)) || address_changed?
  end

  def gmaps4rails_infowindow
    "<h3>#{self.name}</h3><br><a href=\"/pieces/#{self.id}\">Click for details</a>"
  end
end
