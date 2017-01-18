module Setup
  class Snippet
    include Mongoid::Document
    include CrossOrigin::Document
    include Cenit::MultiTenancy::Scoped

    origins :default, -> { Cenit::MultiTenancy.tenant_model.current && :owner }, :shared

    field :code, type: String, default: ''
  end
end
