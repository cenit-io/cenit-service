module Setup
  class Validator
    include Mongoid::Document
    include CrossOrigin::Document
    include Cenit::MultiTenancy::Scoped

    origins :default, -> { Cenit::MultiTenancy.tenant_model.current && :owner }, :shared
  end
end