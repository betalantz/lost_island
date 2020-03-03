require_relative './environment'

LINCOLN_ISLAND = Island.create_island
ME = Adventurer.new(LINCOLN_ISLAND)
LOCK_TIME = Time.now.freeze