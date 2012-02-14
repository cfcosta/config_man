require 'yaml'
require 'ostruct'
require 'delegate'
require "config_man/version"

module ConfigMan
  class Item < OpenStruct
    def initialize(attributes)
      @attributes = attributes

      attributes = attributes.map do |k,v|
        v = self.class.new(v) if v.is_a? Hash
        [k,v]
      end

      super(attributes)
    end

    def to_hash
      @attributes
    end
  end

  class Loader < SimpleDelegator
    def initialize(contents)
      struct = YAML.load(contents).map do |k,v|
        v = Item.new(symbolize_keys(v)) if v.is_a? Hash
        [k,v]
      end

      super(Item.new(Hash[struct]))
    end

    private
    # Borrowed from ActiveSupport
    def symbolize_keys(hash)
      map = hash.map { |(k,v)| [(k.to_sym rescue k), v] }
      Hash[map]
    end
  end
end
