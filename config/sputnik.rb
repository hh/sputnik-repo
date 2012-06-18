current_dir = File.dirname(File.absolute_path(__FILE__))

log_level                :info
log_location             STDOUT
cache_type               'BasicFile'
cache_options            :path =>  "#{ENV['HOME']}/.chef/checksums"

role_path "#{current_dir}/../roles"
file_cache_path "#{current_dir}/../cache"
data_bag_path "#{current_dir}/../data_bags"

begin
  require 'librarian/chef/integration/knife'
  cookbook_path Librarian::Chef.install_path, "#{current_dir}/../site-cookbooks"
rescue LoadError
  cookbook_path "#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"
end

