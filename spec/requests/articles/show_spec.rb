# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Articles' do
  describe 'GET /articles/:id' do
    let!(:article) { create(:article) }

    path '/articles/{id}' do
      get 'get article' do
        produces 'application/json'

        expected_response_schema = SpecSchemas::Response::ArticleSchema.new
        expected_error_response_schema = SpecSchemas::Response::ErrorSchema.new

        parameter name: :id,
                  in: :path,
                  type: :integer

        response 200, 'Success' do
          let(:id) { article.id }

          schema expected_response_schema.schema.as_json

          it { expect(response).to have_http_status(:ok) }

          it_behaves_like 'valid_response_schema' do
            let(:expected_response_schema) { expected_response_schema }
          end

          run_test!
        end

        response 404, 'NotFound' do
          let(:id) { -1 }

          schema expected_error_response_schema.schema.as_json

          it { expect(response).to have_http_status(:not_found) }

          it_behaves_like 'valid_response_schema' do
            let(:expected_response_schema) { expected_error_response_schema }
          end

          run_test!
        end
      end
    end
  end
end
