# frozen_string_literal: true

describe RegisterArtist do
  subject(:success_context) { RegisterArtist.call(artist_name: 'Filipek') }
  subject(:not_found_context) { RegisterArtist.call(artist_name: 'Aleo872') }

  describe '.call' do
    context 'when an artist is found' do
      it 'succeeds' do
        expect(success_context).to be_a_success
      end
    end

    context 'when an artist does not exist' do
      it 'failured' do
        expect(not_found_context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(not_found_context.error).to be_present
      end
    end
  end
end
