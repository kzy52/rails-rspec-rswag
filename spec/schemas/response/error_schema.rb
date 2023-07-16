# frozen_string_literal: true

module SpecSchemas
  module Response
    class ErrorSchema
      include JSON::SchemaBuilder

      def schema
        object do
          array :errors do
            items type: :string
          end
        end
      end
    end
  end
end
