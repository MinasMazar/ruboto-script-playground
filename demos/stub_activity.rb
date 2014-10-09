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
  end

  ## Other unique activity code
end
