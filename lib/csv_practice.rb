# csv_practice.rb
require 'csv'
require 'awesome_print'

# filename = "../data/athlete_events.csv"
# Part 1 - CSV Practice
def load_data(filename)
  olympic_data = CSV.open(filename, 'r', headers: true).map do |item|
    item.to_h
  end
  return olympic_data
  
end
olympic_data = load_data("../data/athlete_events.csv")
ap olympic_data.class


def total_medals_per_country(olympic_data)
  medal_hash = {}
  medal_tally = 0
  medals = %w(Gold Silver Bronze)
  ap medals
  olympic_data.each do |hash|
    hash.each do |k,v|
      # ap k['Medal']
      if medals.include?(k['Medal'])
        medal_tally += 1
        team = k
        medal_hash = {k => medal_tally}
      end
    end
  end
  return medal_hash
end
# ap olympic_data[0]['Medal']
medal_hash = total_medals_per_country(olympic_data)
ap medal_hash.class



def save_medal_totals(filename, medal_totals)

end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)

end

def metals_sorted_by_country(metal_totals)

end

def country_with_most_metals(metal_totals)

end

def athlete_height_in_inches(olympic_data)

end
