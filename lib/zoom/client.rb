# frozen_string_literal: true

require 'httparty'

module Zoom
  class Client
    include HTTParty
    include Actions::Token
    include Actions::Account
    include Actions::Group
    include Actions::M323Device
    include Actions::User
    include Actions::Meeting
    include Actions::Metrics
    include Actions::Webinar
    include Actions::Report
    include Actions::Recording
    include Actions::Roles
    include Actions::IM::Chat
    include Actions::IM::Group

    base_uri 'https://api.zoom.us/v2'
    headers 'Accept' => 'application/json'
    headers 'Content-Type' => 'application/json'

    def headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
      }
    end

    def oauth_request_headers
      {
        'Authorization' => "Basic #{auth_token}"
      }.merge(headers)
    end

    def request_headers
      {
        'Authorization' => "Bearer #{access_token}"
      }.merge(headers)
    end
  end
end

require 'zoom/clients/jwt'
require 'zoom/clients/oauth'
