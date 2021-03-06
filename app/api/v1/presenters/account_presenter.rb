module V1
  module Presenters
    module AccountPresenter
      include Gris::Presenter

      property :id, writeable: false, type: String, desc: 'Account unique ID.'
      property :name, writeable: true, type: String, desc: 'Account name.'
      property :created_at, writeable: false, type: DateTime, desc: 'Account created timestamp.'
      property :updated_at, writeable: false, type: DateTime, desc: 'Account updated timestamp.'

      link :self do
        "#{Gris::Identity.base_url}/accounts/#{id}"
      end

      link :features do
        "#{Gris::Identity.base_url}/features?account_id=#{id}"
      end

      link :messages do
        "#{Gris::Identity.base_url}/messages?account_id=#{id}"
      end

      link :routes do
        "#{Gris::Identity.base_url}/routes?account_id=#{id}"
      end
    end
  end
end
