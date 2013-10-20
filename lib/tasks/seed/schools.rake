namespace :seed do
  namespace :schools do

    combined_csv_path = Rails.root.join("lib","assets","seed","schools_combined.csv")
    clean_csv_path = Rails.root.join("lib","assets","seed","schools_clean.csv")

    task :clean_input => :environment do
      original_lines = File.readlines(Rails.root.join("lib","assets","seed","schools.csv"))

      puts "..combining rows that should be one"

      correct_lines = []
      original_lines.each_with_index do |line, index|
        # get rid of new lines because of parsing problems
        line = line.chomp.gsub(/\n/," ")
        # if the beginning of this line matches the beginning pattern
        if line =~ /\A"(\d+|unitid)"/
          correct_lines << line
        # else add it to to the previous line
        else
          correct_lines.push(correct_lines.pop + line)
        end
      end
      
      File.open(combined_csv_path, "wb") do |f|
        correct_lines.each { |line| f.write(line.strip + "\n") }
      end
      puts "..cleaning the content in each row"
      i = 0
      
      correct_lines.each_with_index do |line, index|
        i += 1
        # match double quotes inside of double quotes and replace with single quotes
        # moved this regex into a class because of all the problems developing it
        correct_lines[index] = InternalQuoteCleaner.new(line).clean
      end

      puts "..creating clean input file"

      File.open(clean_csv_path, "wb") do |f|
        correct_lines.each { |line| f.write(line.strip + "\n") }
      end

      puts "..testing the csv file"
      File.open(clean_csv_path).each_line do |line|
        begin
          CSV.parse(line)
        rescue => e
          puts line
          raise e
        end
      end
    end

    task :attributes do
      File.open(clean_csv_path).each_line do |line|
        puts CSV.parse(line).to_yaml
        break
      end
    end

    task :unique_values, [:column] =>[:environment] do |t, args|
      unique_values = Set.new
      CSV.foreach(clean_csv_path, headers: true) do |row|
        unique_values.add(row[args[:column]])
      end
      puts unique_values.to_a.to_yaml
    end

    task :create => [:environment, :clean_input] do

      puts "seeding schools"

      puts "..creating the schools"

      school_count = 0
      School.transaction do
        CSV.foreach(clean_csv_path, headers: true) do |row|
          attribute_builder = SchoolAttributesBuilder.new(row)
          next unless attribute_builder.address?
          attributes = attribute_builder.attributes
          school = School.where(ipeds_id: attributes.delete(:ipeds_id)).first_or_initialize

          begin
            school.update!(attributes)
            school_count += 1
            puts "....created #{school_count}" if school_count % 1000 == 0
          rescue => e
            puts row
            raise e
          end
        end
      end
      puts "..created #{school_count} schools"
      puts "..seeding schools complete"
    end

  end
  task :schools do
    Rake::Task["seed:schools:create"].invoke
  end
end