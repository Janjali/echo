module V2
  module Endpoints
    class RootEndpoint < Grape::API
      format :json
      formatter :json, Grape::Formatter::Roar
      content_type :json, 'application/hal+json'
      version 'v2', using: :header, vendor: 'echo'
      cascade true

      before do
        token_authentication!
      end

      desc 'Get the Root API Endpoint'
      get do
        present self, with: Presenters::RootPresenter
      end

      mount V2::Endpoints::AccountsEndpoint
    end
  end
end
