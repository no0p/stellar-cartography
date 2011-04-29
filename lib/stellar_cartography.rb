module StellarCartography

  #List of abbreviations from US Postal Service
  
  PRIMARY_STREET_INDICATORS = {"blvd"=>"boulevard", "ave"=>"avenue", "st"=>"street", "str"=>"street", "avnue"=>"avenue", "boulv"=>"boulevard", "rds"=>"roads",  "rd"=>"road", "hwy"=>"highway", "la"=>"lane", "dr"=>"drive", "drv"=>"drive", "ct"=>"court"}
  
  STREET_INDICATORS = { "driv"=>"drive", "drs"=>"drives", "crt"=>"court", "brk"=>"brook", "vlg"=>"village", "vst"=>"vista", "hway"=>"highway", "frwy"=>"freeway", "exts"=>"extensions", "statn"=>"station", "crcl"=>"circle", "mssn"=>"mission", "hl"=>"hill", "mtns"=>"mountains", "ter"=>"terrace", "cswy"=>"causeway", "cr"=>"creek", "cmp"=>"camp", "crscnt"=>"crescent", "nck"=>"neck", "straven"=>"stravenue", "rte"=>"route", "prk"=>"park", "villag"=>"village", "annx"=>"annex", "grdns"=>"gardens", "lndng"=>"landing", "tunel"=>"tunnel", "cnyn"=>"canyon", "highwy"=>"highway", "knol"=>"knoll", "rdg"=>"ridge", "tunnels"=>"tunnel", "grvs"=>"groves", "avenu"=>"avenue", "fwy"=>"freeway", "bot"=>"bottom", "tpk"=>"turnpike", "rdgs"=>"ridges", "clb"=>"club", "canyn"=>"canyon", "anx"=>"annex", "ht"=>"heights", "loops"=>"loop", "prr"=>"prairie", "vis"=>"vista", "plz"=>"plaza", "cresent"=>"crescent", "lanes"=>"lane", "cts"=>"courts","bnd"=>"bend", "hbrs"=>"harbors", "rivr"=>"river", "prt"=>"port", "hls"=>"hills", "kys"=>"keys", "clf"=>"cliff", "prts"=>"ports", "inlt"=>"inlet", "pne"=>"pine", "strav"=>"stravenue", "uns"=>"unions", "turnpk"=>"turnpike", "hiwy"=>"highway", "xing"=>"crossing", "fld"=>"field", "junctn"=>"junction", "ests"=>"estates", "cyn"=>"canyon", "traces"=>"trace", "parkwy"=>"parkway", "gdn"=>"garden", "trks"=>"track", "skwy"=>"skyway", "expr"=>"expressway", "cvs"=>"coves", "jctns"=>"junctions", "jction"=>"junction", "crse"=>"course", "shl"=>"shoal", "spngs"=>"springs", "lndg"=>"landing", "tunl"=>"tunnel", "tunnl"=>"tunnel", "trak"=>"track", "ky"=>"key", "exp"=>"expressway", "rpd"=>"rapid", "forg"=>"forge", "dl"=>"dale", "lcks"=>"locks", "hbr"=>"harbor", "mtwy"=>"motorway", "vly"=>"valley", "dm"=>"dam", "circ"=>"circle", "vlgs"=>"villages", "wl"=>"well", "cir"=>"circle", "lck"=>"lock", "circl"=>"circle", "tpke"=>"turnpike", "centr"=>"center", "mnr"=>"manor", "strave"=>"stravenue", "expw"=>"expressway", "tr"=>"trail", "blfs"=>"bluffs", "frd"=>"ford", "grov"=>"grove", "sta"=>"station", "hgts"=>"heights", "mnt"=>"mount", "shr"=>"shore", "ext"=>"extension", "expy"=>"expressway", "rpds"=>"rapids", "pkwys"=>"parkways", "terr"=>"terrace", "dvd"=>"divide", "crk"=>"creek", "av"=>"avenue", "prarie"=>"prairie", "villg"=>"village", "bayou"=>"bayoo", "mtn"=>"mountain", "rnchs"=>"ranch", "frg"=>"forge", "villiage"=>"village", "cent"=>"center", "ranches"=>"ranch", "clfs"=>"cliffs", "sprngs"=>"springs", "btm"=>"bottom", "psge"=>"passage", "bluf"=>"bluff", "cor"=>"corner", "dv"=>"divide", "viadct"=>"viaduct", "ml"=>"mill", "pky"=>"parkway", "avn"=>"avenue", "trnpk"=>"turnpike", "ovl"=>"oval", "freewy"=>"freeway", "frk"=>"fork", "vsta"=>"vista", "mdws"=>"meadows", "orch"=>"orchard", "pnes"=>"pines", "fls"=>"falls", "stravn"=>"stravenue", "walk"=>"walks", "vist"=>"vista", "trk"=>"track", "flt"=>"flat", "frks"=>"forks", "crst"=>"crest", "havn"=>"haven", "trl"=>"trail", "pikes"=>"pike", "causway"=>"causeway", "pk"=>"park", "strvn"=>"stravenue", "ctrs"=>"centers", "harbr"=>"harbor", "pl"=>"place", "cen"=>"center", "mtin"=>"mountain", "knl"=>"knoll", "brnch"=>"branch", "wy"=>"way", "stn"=>"station", "pts"=>"points", "arc"=>"arcade", "sqr"=>"square", "mdw"=>"meadow", "vill"=>"village", "trce"=>"trace", "wls"=>"wells", "trpk"=>"turnpike", "sqs"=>"squares", "cirs"=>"circles", "spur"=>"spurs", "crssng"=>"crossing", "harb"=>"harbor", "mt"=>"mount", "ck"=>"creek", "rst"=>"rest", "trwy"=>"throughway", "squ"=>"square", "gdns"=>"gardens", "gtwy"=>"gateway", "bypa"=>"bypass", "sumitt"=>"summit", "frt"=>"fort", "spng"=>"spring", "bgs"=>"burgs", "aven"=>"avenue", "hiway"=>"highway", "boul"=>"boulevard", "grns"=>"greens", "rvr"=>"river", "pr"=>"prairie", "lodg"=>"lodge", "crcle"=>"circle", "mnrs"=>"manors", "vl"=>"ville", "pt"=>"point", "sq"=>"square", "cp"=>"camp", "gardn"=>"garden", "vlys"=>"valleys", "shrs"=>"shores", "bottm"=>"bottom", "frway"=>"freeway", "hts"=>"heights", "fry"=>"ferry", "grdn"=>"garden", "lf"=>"loaf", "sqre"=>"square", "spg"=>"spring", "bch"=>"beach", "frds"=>"fords", "extnsn"=>"extension", "crecent"=>"crescent", "stra"=>"stravenue", "vdct"=>"viaduct", "jctn"=>"junction", "ldge"=>"lodge", "hllw"=>"hollow", "cntr"=>"center", "cors"=>"corners", "div"=>"divide", "jct"=>"junction", "upas"=>"underpass", "cv"=>"cove", "gln"=>"glen", "frgs"=>"forges", "lk"=>"lake", "riv"=>"river", "crssing"=>"crossing", "crsent"=>"crescent", "forests"=>"forest","aly"=>"alley", "allee"=>"alley", "jcts"=>"junctions", "ft"=>"fort", "flts"=>"flats", "vally"=>"valley", "gtway"=>"gateway", "missn"=>"mission", "flds"=>"fields", "holw"=>"hollow", "bypas"=>"bypass", "cnter"=>"center", "rnch"=>"ranch", "vw"=>"view", "ln"=>"lane", "xrd"=>"crossroad", "centre"=>"center", "smt"=>"summit", "blf"=>"bluff", "pkwy"=>"parkways", "is"=>"island", "strvnue"=>"stravenue", "vlly"=>"valley", "mntain"=>"mountain", "radl"=>"radial", "byps"=>"bypass", "strm"=>"stream", "holws"=>"hollow", "grn"=>"green", "gatewy"=>"gateway", "ctr"=>"center", "via"=>"viaduct", "cres"=>"crescent", "plza"=>"plaza", "sqrs"=>"squares", "anex"=>"annex", "byp"=>"bypass", "rdge"=>"ridge", "express"=>"expressway", "medows"=>"meadows", "mntn"=>"mountain", "cpe"=>"cape", "lgts"=>"lights", "curv"=>"curve", "trfy"=>"trafficway", "brks"=>"brooks", "sumit"=>"summit", "mntns"=>"mountains", "plns"=>"plains", "est"=>"estate", "lks"=>"lakes", "shoar"=>"shore", "extn"=>"extension", "islnd"=>"island", "ldg"=>"lodge", "trls"=>"trail", "brg"=>"bridge", "byu"=>"bayoo", "hvn"=>"haven", "crsnt"=>"crescent", "pln"=>"plain", "mls"=>"mills", "un"=>"union", "strt"=>"street", "ally"=>"alley", "spgs"=>"springs", "rad"=>"radial", "grv"=>"grove", "isles"=>"isle", "tunls"=>"tunnel", "cmn"=>"common", "pkway"=>"parkway", "br"=>"branch", "frst"=>"forest"}

  STATES = {"VA"=>"Virginia", "ND"=>"North Dakota", "NY"=>"New York", "AL"=>"Alabama", "RI"=>"Rhode Island", "NE"=>"Nebraska", "MN"=>"Minnesota", "MD"=>"Maryland", "HI"=>"Hawaii", "DE"=>"Delaware", "CO"=>"Colorado", "WY"=>"Wyoming", "MO"=>"Missouri", "ME"=>"Maine", "IA"=>"Iowa", "OR"=>"Oregon", "OH"=>"Ohio", "KY"=>"Kentucky", "IL"=>"Illinois", "AZ"=>"Arizona", "TX"=>"Texas", "TN"=>"Tennessee", "NH"=>"New Hampshire", "GA"=>"Georgia", "SC"=>"South Carolina", "IN"=>"Indiana", "ID"=>"Idaho", "SD"=>"South Dakota", "PA"=>"Pennsylvania", "OK"=>"Oklahoma", "NJ"=>"New Jersey", "MS"=>"Mississippi", "MI"=>"Michigan", "FL"=>"Florida", "CT"=>"Connecticut", "AR"=>"Arkansas", "WI"=>"Wisconsin", "MT"=>"Montana", "VT"=>"Vermont", "NV"=>"Nevada", "KS"=>"Kansas", "CA"=>"California", "WV"=>"West Virginia", "UT"=>"Utah", "NM"=>"New Mexico", "MA"=>"Massachusetts", "DC"=>"District Of Columbia", "WA"=>"Washington", "NC"=>"North Carolina", "LA"=>"Louisiana", "AK"=>"Alaska", "ON" => "Ontario", "QC" => "Quebec", "NS" => "Novia Scotia", "NB" => "New Brunswick", "MB" => "Manitoba", "BC" => "British Columbia", "PE" => "Prince Edward Island", "SK" => "Saskatchewan", "AB" => "Alberta", "NL" => "Newfoundland and Labrador"}
  
  ORDINAL_NUMBERS = {"1st" => "first", "2nd" => "second", "3rd" => "third", "4th" => "fourth", "5th" => "fifth", "6th" => "sixth", "7th" => "seventh", "8th" => "eigth", "9th" => "ninth", "10th" => "tenth", "11th" => "eleventh", "12th" => "twelfth", "13th" => "thirteenth"}
  
  ORDINAL_DIRECTIONS = {"s" => "south", "n" => "north", "e" => "east", "w" => "west", "se" => "southeast", "sw" => "southwest", "ne" => "northeast", "nw" => "northwest"} 
  
  SYMBOLS = {"&" => "and"}
  
  WIPE_SYMBOLS = ['-', '\/', '\.']
  
  DOMAIN_WORDS = {"arpt" => "airport", "ctr" => "center"}
  
  
  CITIES = {} #TODO Load from /data with garbage collection insurance

	def self.parse_address(corpus)
    corpus = self.prepare(corpus)
    address = nil
    matched = false
    [PRIMARY_STREET_INDICATORS, STREET_INDICATORS].each do |a|
      if !matched
        (a.values + a.keys).each do |si|
          match = corpus.match(/\s#{si.downcase}\s/)
          if match
            street_piece = match.to_s.gsub(/\s/, '')
            address = corpus.split(street_piece).first.gsub(/\t/, ' ').gsub(/\s\s/, ' ')
            address = address.clean + " " + street_piece
            matched = true
            break
          end
        end
      end
    end
    return address.to_s
  end
  
  def self.parse_state(corpus)
    corpus = self.prepare(corpus)
    state = nil
    states = STATES.to_a.flatten
    
    states.each do |s|
      match = corpus.match(/\s#{s.downcase}[\s,]/)
      if match
        state = match.to_s.gsub(/\s/, '')
        
        state = STATES.invert[state.wordcap] unless state.length < 3
        break
      end
    end
    
    return state.to_s
  end
  
  def self.parse_zipcode(corpus)
    corpus = corpus.gsub(/\t/, ' ').gsub(/\s\s/, '').lstrip.rstrip
    match = corpus.match(/[0-9\-]+$/)
    match.to_s
  end
  
  def self.parse_city(corpus)
    corpus = self.prepare(corpus)
    
    address = self.parse_address(corpus)
    state = self.parse_state(corpus)
    zipcode = self.parse_zipcode(corpus)
    
    corpus = corpus.gsub(address, '')
    
    corpus = corpus.gsub(/\s#{state.downcase}\s/, '')
    
    corpus = corpus.gsub(zipcode, '')
    
    corpus = corpus.gsub(/\t/, ' ').gsub(/[^a-zA-Z\s]/, '').gsub(/\s\s/, '').lstrip.rstrip
    
    #special case, has duplicate city, i.e. the longest substring is > 7 & symetrically split by a space
    pieces = corpus.split " "
    if pieces.length > 1 && (pieces.length % 2 == 0)
      count = pieces.length / 2
      piece_a = ""
      piece_b = ""
      0.upto(count - 1) { |i| piece_a << " " + pieces.shift }
      0.upto(count - 1) { |i| piece_b << " " + pieces.shift }
      corpus = piece_a.clean unless (piece_a != piece_b)     
    end
    
    return corpus.to_s  
  end
  
  def self.normalize_address(corpus)
    corpus = corpus.inflate.downcase.letters_and_numbers_and_spaces

    [PRIMARY_STREET_INDICATORS, STREET_INDICATORS, ORDINAL_DIRECTIONS, ORDINAL_NUMBERS, SYMBOLS, DOMAIN_WORDS].each do |h|
      h.each do |k, v|
        break unless !corpus.gsub!(/\s#{k}\s/, ' ' + v + ' ')
      end
    end
    
    WIPE_SYMBOLS.each do |s|
      corpus.gsub!(/#{s}/, ' ')
    end
    
    return corpus.clean
  end
  
  def self.normalize_name(corpus)
    corpus.downcase!
    return corpus.clean
  end

  def self.normalize_state(corpus)
    return corpus unless !STATES.include? corpus
    return STATES.invert[corpus.downcase.wordcap] unless !STATES.values.include? corpus.downcase.wordcap
    return corpus
  end

  def self.normalize_city(corpus)
    corpus.to_s.downcase.wordcap
  end
  
  def self.better_zipcode(a, b)
    better = a.to_s
    better = b unless b.to_s.match /[^0-9]/
    better = a unless a.to_s.match /[^0-9]/
    return better
  end
  
  
  private
  
  def self.prepare(corpus)
    corpus.downcase!
    [" us ", "united states"].each do |unwanted|
      corpus = corpus.gsub(/#{unwanted}/, ' ')
    end
    
    WIPE_SYMBOLS.each do |s|
      corpus.gsub!(/#{s}/, ' ')
    end
    
    return corpus.to_s
  end
  

  
end

