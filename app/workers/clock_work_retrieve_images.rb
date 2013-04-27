require 'clockwork'
require '../../config/boot'
require '../../config/environment'
# require 'instagram_worker'
require 'clockwork'
include Clockwork


every(4.hours, "Retrieving Instagram Pictures") do
  # puts "Retrieving Instagram images"
  Instagram.retrieve_popular_images
  # InstagramWorker.perform_async
  # puts "Finished retrieving images"
end
