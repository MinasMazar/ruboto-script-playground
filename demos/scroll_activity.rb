require 'ruboto/widget'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :ScrollView

$irb.start_ruboto_activity do
  
  def on_create(bundle)
    super
    set_title self.to_s
    self.content_view = linear_layout do
      button :text => 'Button', :on_click_listener => proc { upcase_text __FILE__ }
        @text_view = text_view :text => 'TextView', :layout => { :width => :wrap_content }
    end
  end
  
  private
  
  def upcase_text(s)
    @text_view.text = s.to_s.upcase
  end

end
