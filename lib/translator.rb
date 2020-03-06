require 'yaml'
require 'pry'


def load_library(file_path)
  hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoticons = YAML.load_file(file_path)
  emoticons.each do |name, emoji|
    hash['get_meaning'][emoji[1]] = name
    hash['get_emoticon'][emoji[0]] = emoji[1]
    
  end
  hash
end

def get_japanese_emoticon(file_path, usa_emo)
  result = load_library(file_path)
  result['get_emoticon'].each do |usa, jap|
    if usa_emo == usa
      return jap
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emo)
  result = load_library(file_path)
  result['get_meaning'].each do |jap, meaning|
    if jap_emo == jap
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end

