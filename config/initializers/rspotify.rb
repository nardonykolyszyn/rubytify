# frozen_string_literal: true

RSpotify.authenticate ENV.fetch('SPOTIFY_CLIENT_ID'), ENV.fetch('SPOTIFY_CLIENT_SECRET')
