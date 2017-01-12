module Setup
  class Snippet
    include Mongoid::Document
    include Cenit::MultiTenancy::Scoped

    field :code, type: String, default: ''
  end
end
