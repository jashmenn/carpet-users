require 'rack/utils'
require 'digest/md5'

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

  def fb_cookie
    args = []
    payload = ''
    return parse_and_verify_fb_cookie_string(cookies["fbs_#{Rails.application.config.fb_app_id}"])
  end

  def fb_session
    fb_cookie["session_key"]
  end

  def fb_uid
    fb_cookie["uid"]
  end

  def fb_access_token
    fb_cookie["access_token"]
  end

  private
  def parse_and_verify_fb_cookie_string(string)
    cookies = {}
    sig = nil
    payload = ""
    pairs = string.split("&") 
    pairs.sort.each do |pair|
      key, value = pair.split("=").map { |v| Rack::Utils.unescape(v) }
      if key == "sig"
        sig = value
      else
        cookies[key] = value
        payload += key + '=' + value
      end
    end
    if Digest::MD5.hexdigest(payload + Rails.application.config.fb_app_secret) != sig
      return nil
    else
      return cookies
    end
  end


end
