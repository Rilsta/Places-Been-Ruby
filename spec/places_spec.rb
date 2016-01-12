require('rspec')
require('places')

describe(Place) do
  describe('#place_name') do
    it('lets you give it a place name') do
      test_place = Place.new('Madagascar')
      expect(test_place.place_name()).to(eq('Madagascar'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Place.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds place to the array of saved places') do
      test_place = Place.new("Mauritius")
      test_place.save()
      expect(Place.all()).to(eq([test_place]))
    end
  end

end
