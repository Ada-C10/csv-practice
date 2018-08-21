# csv_practice.rb
require 'csv'
require 'awesome_print'
require 'pp'


# Part 1 - CSV Practice
# This method takes a file name and returns the data from the file as an array of Hashes
def load_data(filename)
  olympic_data = CSV.open(filename, 'r', headers: true).map do |item|
    item.to_h
  end
  # p olympic_data.class
  return olympic_data
  
end


# This method takes the array of hashes read in from the file in load_data
# and returns an array of hashes with each element having a country name (team),
# and number of medals that country (team) has won.
def total_medals_per_country(olympic_data)
  medal_arr = []
  medal_hash = {}
  # medal_tally = 0
  medals = %w(Gold Silver Bronze)
  # reduce hash to 2 keys
  keys_to_extract = ['Team', 'Medal']
  teams = []
  olympic_data.each do |ath_hash|
    teams << ath_hash.select { |key,_| keys_to_extract.include? key }
  end
  # reduce array of hashes to winners only
  winners = []
  winners = teams.select { |item| medals.include?(item['Medal'])}
  # consolidate teams, each country = array of hashes w/ medal win
  team_grp = winners.group_by { |team| team['Team']}
  # tally array of hashes by medals won
  team_grp.each_with_index do |k, v|
    # each team gets its own hash
    medal_hash = {:country => k[0], :total_medals => k[1].count}
    # shovel each hash into medal arr
    medal_arr << medal_hash
  end
  
  # ap medal_arr
  return medal_arr
end

# this method writes the medal total information returned from
# total_medals_per_country to another CSV
def save_medal_totals(filename, medal_totals)
  CSV.open(filename, 'w') do |csv|
    csv << medal_totals.first.keys
    medal_totals.each do |team|
      csv << team.values
    end
  end
end

# this method returns an array the names of all Gold medal winners
def all_gold_medal_winners(olympic_data)
  gold_winners = olympic_data.select { |ath_hash| ath_hash['Medal'] == 'Gold' }
  # ap gold_winners
  return gold_winners

end
# this method takes a list of countries and their medal totals and returns the 
# same list, sorted by country
def medals_sorted_by_country(metal_totals)
  sort_country = metal_totals.sort_by { |team_hash| team_hash[:country] }
  # ap sort_country.first(5)
  return sort_country

end

def country_with_most_metals(metal_totals)

end

def athlete_height_in_inches(olympic_data)

end
