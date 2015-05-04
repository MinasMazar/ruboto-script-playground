require './gems-local'

require 'mechanize'

module SkyNet

  DATA_DIR = File.expand_path "../.private/skynet/", __FILE__
  ACCOUNTS_YAML_FILE = File.expand_path "accounts.yaml", DATA_DIR

  def setup
    @agent = Mechanize.new
    @agent.user_agent = Mechanize::AGENT_ALIASES['Linux FireFox']
    @accounts = YAML.load_file ACCOUNTS_YAML_FILE
    raise "No account found" if @accounts.empty?
    @account = @accounts.first
    load_cookies
  end
  
  def login
    login_page = @agent.get 'http://www.ogame.it'
    login_form = login_page.forms.find {|f| f.name == "loginForm" }
    set_form_from_account login_form, @account
    human_wait 0.8
    @overview_page = login_form.submit
    save_cookies
  end

  def overview
    rehash_navigation @overview_page
  end

  private

  def rehash_navigation(page)
    matcher = /\/game\/index\.php\?page=(\w+)/
    links = page.links.select do |l|
      if md = l.uri.to_s.match(matcher)
        if [ "overview", "resources", "station" ].include? md[1]
          true
        end
      end
    end
    binding.pry
  end

  def rehash_data(page)
  end

  def set_form_from_account(form, account)
    kid, login, pass, uni = form.fields
    login.value, pass.value, uni.value = account[:login], account[:pass], account[:uni]
  end

  def cookie_file
    File.expand_path "#{@account[:login]}@#{@account[:uni]}_cookies.yaml", DATA_DIR
  end

  def load_cookies
    begin
      @agent.cookie_jar.load cookie_file
    rescue Errno::ENOENT
      puts "Cookie file not found."
    end
  end

  def save_cookies
    @agent.cookie_jar.save cookie_file
  end

  def human_wait(sec = nil)
    sec = (sec || (rand(2) + 1))
    puts "human waiting: #{sec}"
    sleep sec
  end

end

class SkyNetDriver
  include SkyNet

  def initialize
    setup
  end

end

sn = SkyNetDriver.new

