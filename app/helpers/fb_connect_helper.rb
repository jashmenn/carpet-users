# much of this is borrowed from facebooker, but facebooker doesn't yet work with rails 3
module FbConnectHelper

  def fb_connect_javascript_tag(options = {})
    options[:lang] ||= "en_US"
    # accept both Rails and Facebook locale formatting, i.e. "en-US" and "en_US".
    lang = "/#{options[:lang].to_s.gsub('-', '_')}" if options[:lang]
    # dont use the javascript_include_tag helper since it adds a .js at the end
    if request.ssl?
      "<script src=\"https://www.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php#{lang}\" type=\"text/javascript\"></script>".html_safe
    else
      "<script src=\"http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php#{lang}\" type=\"text/javascript\"></script>".html_safe
    end
  end

end
