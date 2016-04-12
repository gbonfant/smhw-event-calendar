require 'rails_helper'

describe EventsController do
  describe 'GET /index' do
    it 'returns a successful response' do
      get :index

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'when the params given are invalid' do
      it 'does not create an event' do
        post :create, { event: { start_date: DateTime.now } }

        expect(response.status).to eq(500)
        expect(Event.count).to eq(0)
      end
    end

    context 'when the params given are valid' do
      it 'creates a new event' do
        post :create, { event: { start_date: DateTime.now, end_date: 2.days.from_now } }

        expect(response.status).to eq(200)
        expect(Event.count).to eq(1)
      end
    end
  end
end
