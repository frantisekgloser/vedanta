require "bundler/gem_tasks"

task :default => :spec


desc "Prints routes"

task :routes do
  API::Orders.routes.each do |route|
      puts "version=#{route.options[:version]}, method=#{route.options[:method]}, path=#{route.pattern.origin}"
  end
end
