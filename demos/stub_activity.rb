require 'ruboto/activity'
require 'ruboto/widget'
require 'ruboto/util/toast'

java_import 'android.content.res.AssetManager'
java_import 'android.text.InputType'
java_import 'java.io.BufferedReader'
java_import 'java.io.InputStreamReader'
java_import 'java.io.FileNotFoundException'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText

$irb.start_ruboto_activity do
  @@lang = 'it'
  def on_create(bundle)
    super
    set_title 'Stub Ruboto Activity'
    self.content_view = linear_layout :orientation => :vertical do
      text_view :text => '', :layout => {:width => :fill_parent}, :gravity => :center
      @word = edit_text :text => '', :hint => "Word (ex. COL??E?TA)"
      button :text => 'Cruciforce!', :on_click_listener => run_on_ui_thread { cruciforce }
      #scroll_view :layout => { :width => :fill_parent } do
       @result_view = text_view :text => '...', :layout => { :width => :wrap_content}, :gravity => :center
      #end
    end
  end

  ## Other unique activity code
  
  def cruciforce
    cruciforce_start
  end
  
  def cruciforce_start
    @result_view.text = ''
    dict_path = "dict/#{@@lang}_#{@word.text.to_s.length}.dict"
    if File.exists? dict_path
      f = File.new dict_path
      i = 0
      while (l = f.readline.chomp)
        @result_view.text += "#{l}\n"
        i > 40 ? break : i += 1
      end
      f.close
    else
      @result_view.text += "Dictionary not found for [#{@word.text.size}] words lenght\n"
    end
  end
end

