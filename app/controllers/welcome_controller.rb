class WelcomeController < ApplicationController
  
#next two lines required to access the API:

require 'open-uri'

require 'json'

#welcome/home

#just a home/landing-page

def home

end

#action/page where the user will select a station using radio buttons:

def radioselect

#For your ease, an array of all of the rail stations in the MARTA system.

@stations = ["North Springs", "Hamilton E. Holmes", "Lindbergh", "Midtown", "Georgia State", "Reynoldstown/Inman Park", "Dunwoody", "Lenox", "Sandy Springs", "Medical Center", "Doraville", "Chamblee", "Brookhaven/Oglethorpe", "Arts Center", "North Avenue", "Civic Center", "Ashby", "Peachtree Center", "Vine City", "West End", "Airport", "College Park", "East Point", "Philips Arena/CNN Center", "Garnett", "West Lake", "Bankhead", "Oakland City", "Lakewood/Ft. McPherson", "King Memorial", "Avondale", "East Lake", "Kensington", "Decatur", "Indian Creek", "Edgewood/Candler Park", "Inman Park/Reynoldstown", "Buckhead"]

#Let's save them alphabetically - will be easier to find a particular station when choosing from a list.

@stations = @stations.sort_by{|item| item.downcase}

end

  def yourbuses
  @station = params[:station]

  @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

  hash_and_msg_generator(@results, @station)
end

#find this method in the Application Helper!

  # def yourbuses_dropdown
  	#page where the coming buses will be displayed, after the dropdown menu choice

def yourbuses_dropdown

yourstation = Selection.last

@selection = yourstation.station_name

@results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

hash_and_msg_generator(@results, @selection)

#find this method in the Application Helper!

  end
end
