require "bravura_pages/version"
require "bravura_pages/engine"

module BravuraPages
  mattr_accessor :account_class

  def self.setup
    yield self
  end

  def self.account_class
    @@account_class.constantize
  end
end
