require 'cenit/service/engine'
require 'cross_origin'

CrossOrigin.config :shared
CrossOrigin.config :owner,
                   collection: ->(model) do
                     user = Cenit::MultiTenancy.tenant_model.current_tenant.owner
                     "user#{user.id}_#{model.mongoid_root_class.storage_options_defaults[:collection]}"
                   end

module Cenit
  module Service
  end
end
