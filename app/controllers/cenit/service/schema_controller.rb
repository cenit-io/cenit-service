require 'account'

module Cenit
  module Service
    class SchemaController < ApplicationController

      def index
        if (token = Cenit::TenantToken.where(token: params[:token]).first) &&
          token.data && (ns = token.data[:ns]) && (uri = token.data[:uri])
          token.set_current_tenant!
          token.destroy
          criteria = { namespace: ns, uri: uri }
          if (schema = Setup::Schema.where(criteria).first)
            service_url = Cenit.service_url ||
              request.base_url +
                if (service_path = request.path.gsub(Regexp.new("#{Cenit.schema_service_path}\\Z"), '')).empty?
                  '/service'
                else
                  service_path
                end
            render plain: schema.cenit_ref_schema(service_url: service_url)
          else
            criteria[:error] = 'Not found'
            render json: criteria, status: :not_found
          end
        else
          render json: { error: "Invalid token: #{params[:token]}" }, status: :unauthorized
        end
      end
    end
  end
end
