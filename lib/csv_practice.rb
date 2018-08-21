# csv_practice.rb
require 'csv'
require 'awesome_print'
require 'pp'

# filename = "../data/athlete_events.csv"
# Part 1 - CSV Practice
def load_data(filename)
  olympic_data = CSV.open(filename, 'r', headers: true).map do |item|
    item.to_h
  end
  p olympic_data.class
  return olympic_data
  
end
# olympic_data = load_data("../data/athlete_events.csv")
# ap olympic_data.class


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
  # pp winners
  # consolidate teams, each country = array of hashes w/ medal win
  team_grp = winners.group_by { |team| team['Team']}
  # pp team_grp
  # tally array of hashes by medals won
  team_grp.each_with_index do |k, v|
    # each team gets its own hash
    medal_hash = {k[0] => k[1].count}
    #medal_hash[:country] = k[0]
    #medal_hash[:total_medals] = k[1].count
    # shovel each hash into medal arr
    medal_arr << medal_hash
  end
   #     #medal_hash = {[Tea]} == '' }
  #     # if medals.include?(hash['Medal'])
  #     #   medal_tally += 1
  #     #   ap medal_tally
  #     #   team = k
  #     #   medal_hash = {k => medal_tally}
  #     # end
  # p medal_arr['Norway'].value
  # ap medal_arr
  p medal_arr.class
  return medal_arr
end
# ap olympic_data[0]['Medal']
# medal_hash = total_medals_per_country(olympic_data)




def save_medal_totals(filename, medal_totals)
  CSV.open(medal_totals, 'w') do |csv|
    csv << medal_totals.first.keys
    medal_totals.each do |team|
      csv << team.values
    end
  end
end
# def save_planets(planet_data, filename: 'data/close_planet.csv')
#   CSV.open(filename, 'w') do |csv|
#     csv << planet_data.first.keys
#     planet_data.each do |planet|
#       csv << planet.values
#     end
#   end
# end
# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)

end

def metals_sorted_by_country(metal_totals)

end

def country_with_most_metals(metal_totals)

end

def athlete_height_in_inches(olympic_data)

end
