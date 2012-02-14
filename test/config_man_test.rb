$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'minitest/autorun'
require 'config_man'

class ConfigLoaderTest < MiniTest::Unit::TestCase
  def sample
    @sample ||= { 'foo' => 'bar',
      'baz' => {'foo' => 'bar'},
      'qux' => {'foo' => {'bar' => 'baz'}}
    }.to_yaml
  end

  def subject
    @subject ||= ConfigMan::Loader.new(sample)
  end

  def assert_is_a(target, klass, msg = nil)
    msg ||= "Expected #{target} to be a #{klass}"
    assert target.is_a?(klass), msg
  end

  def test_generates_methods_for_top_level_configurations
    assert_equal 'bar', subject.foo
  end

  def test_generates_methods_recursively
    assert_is_a subject.baz, ConfigMan::Item
    assert_is_a subject.qux, ConfigMan::Item
    assert_is_a subject.qux.foo, ConfigMan::Item

    assert_equal 'bar', subject.baz.foo
    assert_equal 'baz', subject.qux.foo.bar
  end

  def test_export_keys_to_hashes
    assert_equal({foo: 'bar'}, subject.baz.to_hash)
  end
end
