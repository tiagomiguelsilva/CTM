class YamlLoader
    include PageObject

    require 'yaml'
    require 'time'

    def self.load_yaml_data_field(yaml_file,field)
        Dir[ File.dirname(__FILE__) + "/data_for_tests/#{yaml_file}.yml"].each do |file|
            return YAML.load(File.read(file))[field]
        end
    end

    def self.load_yaml_data(yaml_file)
        Dir[ File.dirname(__FILE__) + "/data_for_tests/#{yaml_file}.yml"].each do |file|
            return YAML.load(File.read(file))
        end
    end

  def self.load_page_cookie(page)
      Dir[ File.dirname(__FILE__) + "/data_for_tests/pages/#{page}.yml"].each do |file|
          return YAML.load(File.read(file))
      end
  end

end
