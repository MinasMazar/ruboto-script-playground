require 'ruboto/widget'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText

$irb.start_ruboto_activity do
  def on_create(bundle)
    super
    set_title 'stub'
    self.content_view = linear_layout :orientation => :vertical do
      scroll_view do
        13.times { |i| button :text => "#{i} button" }
      end
    end
  end
end
