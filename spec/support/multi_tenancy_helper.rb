# spec/support/multi_tenancy_helper.rb
module MultiTenancyHelper
  def set_tenant(account)
    ActsAsTenant.current_tenant = account
  end
end

RSpec.configure do |config|
  config.include MultiTenancyHelper

  config.before(:each) do
    ActsAsTenant.current_tenant = nil
  end
end
