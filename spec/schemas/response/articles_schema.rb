# frozen_string_literal: true

module SpecSchemas
  module Response
    class ArticlesSchema
      include JSON::SchemaBuilder

      def schema
        object do
          array :articles do
            items do
              [
                object do
                  number :id, required: true, description: 'ID'
                  string :title, required: true, description: 'タイトル'
                  string :content, required: true, description: '本文'
                  string :created_at, required: true, description: '登録日時'
                  string :updated_at, required: true, description: '更新日時'
                end
              ]
            end
          end
        end
      end
    end
  end
end
