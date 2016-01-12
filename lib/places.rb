class Place
  define_method(:initialize) do |place_name|
    @place_name = place_name
  end

  define_method(:place_name) do
    @place_name
  end

  define_singleton_method(:all) do
    []
  end
end
