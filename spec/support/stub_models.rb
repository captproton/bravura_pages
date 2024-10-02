# spec/support/stub_models.rb
module StubModels
  def stub_model(name, attributes = {})
    before(:all) do
      klass = Class.new(ApplicationRecord) do
        attributes.each do |attr, type|
          attribute attr.to_sym, type
        end
      end
      Object.const_set(name, klass) unless Object.const_defined?(name)
    end

    after(:all) do
      Object.send(:remove_const, name) if Object.const_defined?(name)
    end
  end
end

RSpec.configure do |config|
  config.extend StubModels
end
