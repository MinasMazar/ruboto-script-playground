require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView

start_ruboto_activity do

  def on_create(bundle)
    super
    set_title 'Stub Ruboto Activity'
    self.content_view = linear_layout :orientation => :vertical do
      text_view :text => "I Love Ruby <3", :layout => {:width => :match_parent}, :gravity => :center, :text_size => 48.0
    end
    @file = './hangout_dingtone.m4a'
    play_file @file
  end

  def play_file(file)
    request_callback CB_PAUSE
    file = File.new(file)
    uri = Uri.from_file(file)
    @player = MediaPlayer.create(self, uri)
    @player.start
  end

  def on_pause
    @player.stop
  end

  ## Other unique activity code
end
