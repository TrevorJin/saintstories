class GeojsonBuilder
  def self.build_saint(saint)
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [saint.birth_longitude, saint.birth_latitude]
      },
      properties: {
        name: saint.name,
        description: event.description,
        :"marker-color" => "#00607d",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium"
      }
    }
  end
end
