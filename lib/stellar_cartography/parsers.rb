module StellarCartography
  
  #
  # Return true if a string contains street language
  #
  def self.is_street?(corpus)
    is_address = false
    address = self.prepare(corpus)
    [PRIMARY_STREET_INDICATORS, STREET_INDICATORS].each do |a|
      street_indicator = (a.values + a.keys).detect do |si|
        address.match(/\s#{si.downcase}\s/)
      end
      if street_indicator.present?
        is_address = true
        break
      end
    end
    return is_address
  end
  
  def self.parse_address(corpus)
    {:address => self.parse_street(corpus), :city => self.parse_city(corpus), :state => self.parse_state(corpus), :zipcode => self.parse_zipcode(corpus)}
  end
  
  def self.parse_street(corpus)
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
    states = STATES.to_a.flatten
    match = states.detect do |s|
      corpus.match /\s#{s.downcase}(\s|,|$)/
    end
    
    state = match.to_s.clean
    state = STATES.invert[state.wordcap] unless state.length < 3
    
    return state
  end
  
  def self.parse_zipcode(corpus)
    corpus = corpus.gsub(/\t/, ' ').gsub(/\s\s/, '').lstrip.rstrip
    match = corpus.match(/[0-9\-]+$/)
    match.to_s
  end
  
  def self.parse_city(corpus)
    corpus = self.prepare(corpus)
    
    address = self.parse_street(corpus)
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
