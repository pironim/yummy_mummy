# https://gist.github.com/dommmel/7da6ee376866771c7514

desc "Compare two yml files: bundle exec rake compare_yml['coc/en','coc/pl']"
task :compare_yml, [:locale1, :locale2] => :environment do |t, args|
  LOCALE_1 = "config/locales/#{args[:locale1]}.yml"
  LOCALE_2 = "config/locales/#{args[:locale2]}.yml"

  require 'yaml'

  def flatten_keys(hash, prefix="")
    keys = []
    hash.keys.each do |key|
      if hash[key].is_a? Hash
        current_prefix = prefix + "#{key}."
        keys << flatten_keys(hash[key], current_prefix)
      else
        keys << "#{prefix}#{key}"
      end
    end
    prefix == "" ? keys.flatten : keys
  end

  def compare(locale_1, locale_2)
    yaml_1 = YAML.load(File.open(File.expand_path(locale_1)))
    yaml_2 = YAML.load(File.open(File.expand_path(locale_2)))

    keys_1 = flatten_keys(yaml_1[yaml_1.keys.first])
    keys_2 = flatten_keys(yaml_2[yaml_2.keys.first])

    missing = keys_2 - keys_1
    file = locale_1.split('/').last
    if missing.any?
      puts "Missing for #{file} vs #{locale_2} :"
      missing.each { |key| puts "  - #{key}" }
      exit(1) # error for CI
    else
      puts "Nothing missing for #{file}."
    end
  end

  compare(LOCALE_1, LOCALE_2)
end
