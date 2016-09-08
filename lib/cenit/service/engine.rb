module Cenit
  module Service
    class Engine < ::Rails::Engine
      isolate_namespace Cenit::Service
    end
  end
end
