# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Articles' do
  describe 'GET /articles' do
    before { create(:article) }

    path '/articles' do
      get 'get articles' do
        produces 'application/json'

        expected_response_schema = SpecSchemas::Response::ArticlesSchema.new

        parameter name: :page,
                  in: :query,
                  type: :integer

        let(:page) { 1 }

        response 200, 'Success' do
          schema expected_response_schema.schema.as_json

          it { expect(response).to have_http_status(:ok) }

          it_behaves_like 'valid_response_schema' do
            let(:expected_response_schema) { expected_response_schema }
          end

          run_test!
        end
      end
    end
  end
end
