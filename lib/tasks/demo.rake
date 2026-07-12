# frozen_string_literal: true

namespace :demo do
  desc "Remove all Overture migrations, models, schema, and drop database for fresh setup"
  task :clean do
    puts "Dropping database..."
    Rake::Task["db:drop"].invoke

    puts "Removing migration files..."
    Dir.glob("db/migrate/*_create_overture_*.rb").each do |file|
      puts "  Removing #{file}"
      File.delete(file)
    end

    puts "Removing schema.rb..."
    File.delete("db/schema.rb") if File.exist?("db/schema.rb")

    puts "Removing Overture model files..."
    Dir.glob("app/models/overture_*.rb").each do |file|
      puts "  Removing #{file}"
      File.delete(file)
    end

    puts "\nClean complete! Now you can:"
    puts "  rails db:create"
    puts "  rails generate overture_maps:install"
    puts "  rails db:migrate"
  end
end
