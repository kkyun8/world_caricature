json.set! :sample_images do
  json.array! @sample_images do |sample_image|
    json.extract! sample_image, :id, :name
  end
end