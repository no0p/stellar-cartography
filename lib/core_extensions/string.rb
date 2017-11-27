module StellarCartography
  refine String do

    #space clean
    def clean
      self.gsub(/\t/, ' ').gsub(/\s\s/, '').lstrip.rstrip
    end

    def normalize
      self.gsub(/[^a-zA-Z0-9&'\/\-\(\)\s]/, '').downcase.clean
    end

    #only numbers and letters and spaces and periods
    def scrub
      self.gsub(/[^a-zA-Z\s0-9\.]/, '').gsub(/\t/, ' ').gsub(/\r/, ' ').gsub(/\s\s/, '').lstrip.rstrip
    end

    #extract number
    def numscrub
      self.gsub(/[^0-9]/, '')
    end

    #only letters and spaces
    def alphafilter
      self.gsub(/[^a-zA-Z\s]/, '')
    end

    #alpha filter but with a couple symbols allowed
    def name_filter
      self.gsub(/[^a-zA-Z\s\-\(\)]/, '')
    end

    #removes html tags
    def strip_tags
      self.gsub(/<[.^<]*>/, '')
    end

    #just strip the tags themselves
    def strip_tags_delicately
      self.gsub(/<.[^<]*>/, ' ')
    end

    #removes all white space
    def evaporate
      self.gsub(/\s/, '')
    end

    #capitalize the first letter of each word
    def wordcap
      self.split(" ").each{|word| word.capitalize!}.join(" ")
    end

    #add spaces on the end of the string
    def inflate
      " " + self + " "
    end

    #obv
    def letters_and_numbers_and_spaces
      self.gsub(/[^a-zA-Z0-9\s\#]/, '')
    end
  end

end
