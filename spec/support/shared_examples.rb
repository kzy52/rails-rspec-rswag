# frozen_string_literal: true

RSpec.shared_examples 'valid_request_schema' do
  it 'valid request schema' do
    errors = expected_request_schema.schema.fully_validate(params)
    expect(errors).to be_empty
  end
end

RSpec.shared_examples 'valid_response_schema' do
  it 'valid response schema' do
    json_response = JSON.parse(response.body)
    errors = expected_response_schema.schema.fully_validate(json_response)
    expect(errors).to be_empty
  end
end
