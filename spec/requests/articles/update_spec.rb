# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Articles' do
  describe 'PATCH /articles/:id' do
    let!(:article) { create(:article) }

    path '/articles/{id}' do
      patch 'update article' do
        consumes 'application/json'
        produces 'application/json'

        expected_request_schema = SpecSchemas::Request::ArticleSchema.new
        expected_response_schema = SpecSchemas::Response::ArticleSchema.new
        expected_error_response_schema = SpecSchemas::Response::ErrorSchema.new

        parameter name: :id,
                  in: :path,
                  type: :integer

        parameter name: :params,
                  in: :body,
                  schema: expected_request_schema.schema.as_json

        let(:id) { article.id }

        let(:params) do
          {
            article: {
              title: 'article title',
              content: 'article content',
            }
          }
        end

        response 200, 'Success' do
          schema expected_response_schema.schema.as_json

          it { expect(response).to have_http_status(:ok) }

          it_behaves_like 'valid_request_schema' do
            let(:expected_request_schema) { expected_request_schema }
          end

          it_behaves_like 'valid_response_schema' do
            let(:expected_response_schema) { expected_response_schema }
          end

          run_test!
        end

        response 400, 'Bad Request' do
          let(:params) do
            {
              article: {
                title: nil,
                content: nil
              }
            }
          end

          schema expected_error_response_schema.schema.as_json

          it { expect(response).to have_http_status(:bad_request) }

          it_behaves_like 'valid_response_schema' do
            let(:expected_response_schema) { expected_error_response_schema }
          end

          run_test!
        end

        response 404, 'Not Found' do
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
