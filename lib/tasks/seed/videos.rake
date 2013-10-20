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
  end
end