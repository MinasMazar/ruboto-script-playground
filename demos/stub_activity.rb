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
  def on_create(bundle)
    super
    set_title 'Stub Ruboto Activity'
    self.content_view = linear_layout :orientation => :vertical do
      text_view :text => '', :layout => {:width => :match_parent}, :gravity => :center
      @word = edit_text :text => '', :hint => "Word (ex. COL??E?TA)"
      button :text => 'Cruciforce!', :on_click_listener => proc { cruciforce }
    end
  end

  ## Other unique activity code
  
  def cruciforce
#    begin
#      br = BufferedReader.new (InputStreamReader.new (getAssets.open("demo-scripts/dict/#{@lang}_#{@word.text.size}.dict")))
#    rescue FileNotFoundException
#      #@result_pane.notify "Dictionary not found for #{@word.text.size} words lenght"
#    end
#    puts br.inspect
#    puts @word.text
#    return
#    while (l = br.readLine.chomp)
#      
#    end
  end
end

