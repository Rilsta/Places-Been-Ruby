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
end
