module Setup
  class Validator
    include Mongoid::Document
    include Cenit::MultiTenancy::Scoped
  end
end