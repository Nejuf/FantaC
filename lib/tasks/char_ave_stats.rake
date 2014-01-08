#Calculates the average stats of all characters, total and for each affinity
namespace :cache do
	desc "Calculating character stat averages."
	task :char_average_stats => :environment do

		affinities = Hash.new
		Affinity.pluck(:id).map do |affinity_id|
			affinities[affinity_id] = Hash[
				:stat_hp, 0, 
				:stat_str, 0, 
				:stat_def, 0, 
				:stat_spd, 0, 
				:stat_int, 0, 
				:stat_luck, 0,
				:count, 0]
		end

		char_stats = Character.pluck(:affinity_id, :stat_hp, :stat_str, :stat_def, :stat_spd, :stat_int, :stat_luck)
		char_stats.each do |c_stats|
			stats = affinities[c_stats[0]]
			stats[:stat_hp] += c_stats[1]
			stats[:stat_str] += c_stats[2]
			stats[:stat_def] += c_stats[3]
			stats[:stat_spd] += c_stats[4]
			stats[:stat_int] += c_stats[5]
			stats[:stat_luck] += c_stats[6]
			stats[:count] += 1
		end

		affinity_averages = Hash.new
		total_stats = Hash.new(0)
		affinities.each do |aff_id, stat_hash|
			hash = Hash.new
			count = stat_hash[:count]
			hash[:stat_hp] = stat_hash[:stat_hp]/count
			hash[:stat_str] = stat_hash[:stat_str]/count
			hash[:stat_def] = stat_hash[:stat_def]/count
			hash[:stat_spd] = stat_hash[:stat_spd]/count
			hash[:stat_int] = stat_hash[:stat_int]/count
			hash[:stat_luck] = stat_hash[:stat_luck]/count

			affinity_averages[aff_id] = hash

			total_stats[:stat_hp] += stat_hash[:stat_hp]
			total_stats[:stat_str] += stat_hash[:stat_str]
			total_stats[:stat_def] += stat_hash[:stat_def]
			total_stats[:stat_spd] += stat_hash[:stat_spd]
			total_stats[:stat_int] += stat_hash[:stat_int]
			total_stats[:stat_luck] += stat_hash[:stat_luck]
			total_stats[:count] += count
		end


		total_averages = Hash.new
		total_averages[:stat_hp] = total_stats[:stat_hp]/total_stats[:count]
		total_averages[:stat_str] = total_stats[:stat_str]/total_stats[:count]
		total_averages[:stat_def] = total_stats[:stat_def]/total_stats[:count]
		total_averages[:stat_spd] = total_stats[:stat_spd]/total_stats[:count]
		total_averages[:stat_int] = total_stats[:stat_int]/total_stats[:count]
		total_averages[:stat_luck] = total_stats[:stat_luck]/total_stats[:count]

		Rails.cache.write("character_totals", total_stats)
		Rails.cache.write("character_averages", total_averages)
		Rails.cache.write("affinity_averages", affinity_averages)
	end
end