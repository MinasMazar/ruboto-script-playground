
class GemsLocal
  IRB_ROOT_DIR = File.expand_path File.dirname(__FILE__)
  GEM_DIR = File.join(IRB_ROOT_DIR, 'gems')

  def self.setup
    @@singleton ||= new
  end

  def test
    # require 'mechanize'
  end

  private

  def initialize
    Dir.entries(GEM_DIR).each do |dir| 
      $LOAD_PATH << File.join(GEM_DIR, dir, 'lib')
    end
  end

end
