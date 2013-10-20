namespace :seed do
  namespace :videos do
    task :retrieve => :environment do
      puts "beginning to retrieve schools"
      School.all.order("bachelors_degree desc, undergraduate_enrollment desc nulls last").each do |school|
        next if school.videos_last_retrieved_at
        school.retrieve_videos
        puts "..#{school.name} - #{school.id}"
      end
    end
    task :export => :environment do
      CSV.open(Rails.root.join("lib","assets","seed","videos.csv").to_s, "wb") do |csv|
        i = 0
        School.all.find_each do |school|
          i += 1
          next unless school.videos.any?
          school.videos.order(position: :asc).each do |video|
            csv << [school.ipeds_id, video.youtube_id, video.duration, video.title, video.description, video.thumbnail_url]
          end
        end
      end
    end
    task :import => :environment do
      puts "starting import"
      i = 0
      CSV.foreach(Rails.root.join("lib","assets","seed","videos.csv").to_s) do |row|
        school = School.find_by(ipeds_id: row[0])
        school.videos.where(youtube_id: row[1]).first_or_initialize do |v|
          v.duration = row[2]
          v.title = row[3]
          v.description = row[4]
          v.thumbnail_url = row[5]
        end.save!
        i += 1
        puts "..processed #{i}" if i % 1000 == 0
      end
    end
  end
end