module Setup
  class Schema < Validator

    field :namespace
    field :uri, type: String
    field :schema, type: String
    field :schema_type, type: Symbol

    def cenit_ref_schema(options = {})
      options = {
        service_url: Cenit.service_url,
        schema_service_path: Cenit.schema_service_path
      }.merge(options)
      send("cenit_ref_#{schema_type}", options)
    end

    private

    def cenit_ref_json_schema(options = {})
      schema
    end

    def cenit_ref_xml_schema(options = {})
      doc = Nokogiri::XML(schema)
      cursor = doc.root.first_element_child
      while cursor
        if %w(import include redefine).include?(cursor.name) && (attr = cursor.attributes['schemaLocation'])
          token = Cenit::TenantToken.create data: { ns: namespace, uri: abs_uri(uri, attr.value) },
                                            token_span: 1.hour
          attr.value = "#{options[:service_url]}#{"/#{options[:schema_service_path]}".squeeze('/')}?token=#{token.token}"
        end
        cursor = cursor.next_element
      end
      doc.to_xml
    end

    def abs_uri(base_uri, uri)
      uri = URI.parse(uri.to_s)
      return uri.to_s unless uri.relative?

      base_uri = URI.parse(base_uri.to_s)
      uri = uri.to_s.split('/')
      path = base_uri.path.split('/')
      begin
        path.pop
      end while uri[0] == '..' ? uri.shift && true : false

      path = (path + uri).join('/')

      uri = URI.parse(path)
      uri.scheme = base_uri.scheme
      uri.host = base_uri.host
      uri.to_s
    end
  end
end