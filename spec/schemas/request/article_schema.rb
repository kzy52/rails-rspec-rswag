# frozen_string_literal: true

module SpecSchemas
  module Request
    class ArticleSchema
      include JSON::SchemaBuilder

      def schema
        object do
          object :article do
            string :title, required: true, description: 'タイトル'
            string :content, description: '本文'
          end
        end
      end
    end
  end
end
