# frozen_string_literal: true

describe RegisterArtist do
  subject(:context) { RegisterArtist.call(artist_name: 'Filipek') }

  describe '.call' do
    context 'when an artist is found' do
      it 'succeeds' do
        expect(context).to be_a_success
      end
    end
  end
end
