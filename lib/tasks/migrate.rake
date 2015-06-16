namespace :migrate do
  desc "Recreate Version"
  task image: :environment do
    Image.all.each do |image|
      image.file.recreate_versions!
    end
  end
end