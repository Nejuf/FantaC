# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

t = Tier.create!(name: "Bronze")
t = Tier.create!(name: "Silver")
t = Tier.create!(name: "Gold")
t = Tier.create!(name: "Platinum")
# t = Tier.create!(name: "")

cat = Category.create!(name: "standard")
cat = Category.create!(name: "duel")
cat = Category.create!(name: "for glory")
cat = Category.create!(name: "winner-takes-all")
# cat = Category.create!(name: "")

a = Affinity.create!(name: "unaligned")#1
a = Affinity.create!(name: "game")#2
a = Affinity.create!(name: "film")#3
a = Affinity.create!(name: "book")#4
# a = Affinity.create!(name: "")

pay = PayoutType.create!(name: "gold")
pay = PayoutType.create!(name: "prize")
# pay = PayoutType.create!(name: "")

pos = Position.create!(name: "leader")
pos = Position.create!(name: "right-wing")
pos = Position.create!(name: "left-wing")
pos = Position.create!(name: "cook")
# pos = Position.create!(name: "")

u = User.new(email: "user1@gmail.com", username: "user1", password: "12341234")
u.role = "admin"
u.save!
u = User.create!(email: "user2@gmail.com", username: "user2", password: "12341234")
# u = User.create!(email: "user@gmail.com", username: "user", password: "12341234")

c = Character.create!(name: "Link", affinity_id: 2, stat_hp: 10, stat_str: 10, stat_def: 10, stat_spd: 10, tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Jack Sparrow", affinity_id: 3, stat_hp: 10, stat_str: 10, stat_def: 10, stat_spd: 10, tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Harry Potter", affinity_id: 4, stat_hp: 10, stat_str: 10, stat_def: 10, stat_spd: 10, tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Nathan Drake", affinity_id: 2,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Batman", affinity_id: 4,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Mr. Rogers", affinity_id: 3,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Mario", affinity_id: 2,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Merlin", affinity_id: 4,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Luke Skywalker", affinity_id: 3,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
c = Character.create!(name: "Neo", affinity_id: 3,  tier_id: 1)
	por = Portrait.create({
	  :character_id => c.id,
	  :focusX => 0,
	  :focusY => 0,
	  :portrait_image =>  Portrait.load_character_default_image!(c)
	})
# c = Character.create!(name: "", affinity_id: , stat_hp: , stat_str: , stat_def: , stat_spd: , tier_id: )

b = Battle.create!(name: "The Ultimate Showdown of Ultimate Destiny", desc: "all characters, all affinities, one winner", start_date: Time.now.utc.to_s, end_date: (Time.now + 3.hours).utc.to_s)
b = Battle.create!(name: "Game Royale", desc: "Who's the best game character?", start_date: (Time.now + 3.minutes).utc.to_s, end_date: (Time.now + 1.hour).utc.to_s)
b = Battle.create!(name: "Film Royale", desc: "Who's the best film character?", start_date: (Time.now + 3.minutes).utc.to_s, end_date: (Time.now + 90.minutes).utc.to_s)
b = Battle.create!(name: "Book Royale", desc: "Who's the best book character?", start_date: (Time.now + 3.minutes).utc.to_s, end_date: (Time.now + 2.hour).utc.to_s)
# b = Battle.create!(name: "", desc: "", start_date: Time.now.utc.to_s, end_date: (Time.now + 20.minutes).utc.to_s)

con = Contest.create!(name: "Showdown Base", desc: "The ultimate showdown.", category_id: 1, battle_id: 1, points_cap: 10, entry_fee: 0, payout_type_id: 1)
con = Contest.create!(name: "Showdown Duel", desc: "You dare challenge me?", category_id: 2, battle_id: 1, points_cap: 10, entry_fee: 0, payout_type_id: 1)
con = Contest.create!(name: "Game Royal Base", desc: "Gamer's glory.", category_id: 3, battle_id: 2, points_cap: 10, entry_fee: 0, payout_type_id: 1)
con = Contest.create!(name: "Film Royal Base", desc: "Unlease the tomatoes!", category_id: 4, battle_id: 3, points_cap: 30, entry_fee: 0, payout_type_id: 1)
con = Contest.create!(name: "Book Royal Base", desc: "Turn the pages of fate.", category_id: 1, battle_id: 4, points_cap: 50, entry_fee: 0, payout_type_id: 1)
# con = Contest.create!(name: "", desc: "", category_id: , battle_id: , points_cap: , entry_fee: , payout_type_id: )

cpos = ContestPosition.create!(contest_id: 1, position_id: 1)
cpos = ContestPosition.create!(contest_id: 1, position_id: 2)
cpos = ContestPosition.create!(contest_id: 1, position_id: 3)
cpos = ContestPosition.create!(contest_id: 1, position_id: 4)
cpos = ContestPosition.create!(contest_id: 2, position_id: 1)
cpos = ContestPosition.create!(contest_id: 2, position_id: 4)
cpos = ContestPosition.create!(contest_id: 3, position_id: 1)
cpos = ContestPosition.create!(contest_id: 3, position_id: 2)
cpos = ContestPosition.create!(contest_id: 3, position_id: 3)
# cpos = ContestPosition.create!(contest_id: , position_id: )

e = Entry.create!(user_id: 1, contest_id: 1)
# e = Entry.create!(name: "", desc: "", user_id: , contest_id: )

ce = CharacterEntry.create!(entry_id: 1, character_id: 1, position_id: 1)
ce = CharacterEntry.create!(entry_id: 1, character_id: 2, position_id: 2)
ce = CharacterEntry.create!(entry_id: 1, character_id: 3, position_id: 3)
ce = CharacterEntry.create!(entry_id: 1, character_id: 4, position_id: 4)
# ce = CharacterEntry.create!(entry_id: , character_id: , position_id: )

br = BattleRoster.create!(battle_id: 1, character_id: 1)
br = BattleRoster.create!(battle_id: 1, character_id: 2)
br = BattleRoster.create!(battle_id: 1, character_id: 3)
br = BattleRoster.create!(battle_id: 1, character_id: 4)
br = BattleRoster.create!(battle_id: 1, character_id: 5)
br = BattleRoster.create!(battle_id: 1, character_id: 6)
br = BattleRoster.create!(battle_id: 1, character_id: 7)
br = BattleRoster.create!(battle_id: 1, character_id: 8)
br = BattleRoster.create!(battle_id: 1, character_id: 9)
br = BattleRoster.create!(battle_id: 1, character_id: 10)
br = BattleRoster.create!(battle_id: 2, character_id: 1)
br = BattleRoster.create!(battle_id: 2, character_id: 4)
br = BattleRoster.create!(battle_id: 2, character_id: 7)
# br = BattleRoster.create!(battle_id: , character_id: , character_points: )