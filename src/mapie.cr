require "./mapie/pie"
require "./mapie/cli/**"
require "./mapie/pie_parser/**"

module Mapie
  VERSION = "0.1.0"

  pie = Pie.load_from("./demo/mapie.yml")
end
