module Script
  class ::String
    def to_a
      chars.to_a
    end
    def self.fits(a,b)
      return false if a.size != b.size
      redux = [ a.to_a, b.to_a ].transpose.find_all do |c|
        (c[0] == c[1]) || (c[0] == '?') || (c[1] == '?')
      end
      redux.size == a.size
    end
    def fits(s)
      self.class.fits(self, s)
    end
  end
  
  @@th = nil
  def self.start(&block)
    @@th = Thread.new(&block) if @@th.nil?
  end
  def self.stop
    @@th && @@th.kill
    @@th = nil
  end
  class Cruciforcer
    @@lang = 'it' 
    def force(w)
      word = w.split.map(&:strip).join
      dict_path = "dict/#{@@lang}_#{word.length}.dict"
      if File.exists? dict_path
        f = File.new dict_path
        total = matched = 0
        begin
          while (cword = f.readline.chomp)
            #puts "....try #{cword}"
            if word.fits cword
              puts "[#{cword}] fits!" 
              matched += 1
            end
            total += 1
          end
          puts "Found #{matched}/#{total} words"
        rescue EOFError
          #
        end
      else
        puts "Dictionary not found for #{word.length} words length"
      end
    end
  end
  
  @@cruciforcer = Cruciforcer.new
  
  def self.cforce(s = nil)
    if s.kind_of? String
      start do
        @@cruciforcer.force s
      end
    elsif s == nil
      stop
    end
  end
end

def cforce(s = nil)
  Script.cforce s
end

# cforce 'st?ntuf??'
