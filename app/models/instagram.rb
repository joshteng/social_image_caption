class Instagram
  include HTTParty

  def self.retrieve_popular_images
    response = HTTParty.get("https://api.instagram.com/v1/media/popular?access_token=#{ENV['ACCESS_TOKEN']}")
    images = []

    response['data'].each do |image|
      images << image['images']['low_resolution']['url']
    end
    images.each { |i| Image.create(source_url: i) }
  end
end
