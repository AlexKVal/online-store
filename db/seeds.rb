# encoding: utf-8
Product.delete_all
Product.create!(title: 'Counter Strike',
  description:
    %{<p>
        Counter Strike is just fine.
      </p>},
  image_url:   'cs.jpg',
  price: 20.00)
# . . .
Product.create!(title: 'Ruby 2.0',
  description:
    %{<p>
        Ruby is a pink to blood-red colored gemstone, a variety of the mineral
        corundum (aluminium oxide). The red color is caused mainly by the
        presence of the element chromium. Its name comes from ruber, Latin for
        red. Other varieties of gem-quality corundum are called sapphires.
        Ruby is considered one of the four precious stones, together with
        sapphire, emerald and diamond.
      </p>},
  image_url: 'ruby.jpg',
  price: 30.33)
# . . .

Product.create!(title: 'Rails',
  description:
    %{<p>
        Early <em>rails</em> were made of wood, cast iron or wrought iron. All
        modern rails are hot rolled steel of a specific cross sectional
        profile. Typically the cross section (profile) approximates an I-beam
        but is asymmetric about a horizontal axis (however see grooved rail
        below). The head is profiled to resist wear and to give a good ride,
        the foot is profiled to suit the fixing system.
      </p>},
  image_url: 'rtp.jpg',
  price: 44.44)
