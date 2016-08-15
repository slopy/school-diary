require 'rails_helper'

RSpec.describe ReportsController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #subjects' do
    subject { get :subjects }

    it_behaves_like 'template rendering action', :subjects
  end

  describe 'GET #payments' do
    subject { get :payments }

    it_behaves_like 'template rendering action', :payments
  end

  describe 'GET #students_datatable' do

    let!(:payment_date) { create :payment_date }                              
    let!(:student) { create :student, first_name: 'Jan',
                                      last_name: 'Nowak',
                                      birthdate: Date.new(1992,01,02) }
        
    before(:each) do 
      get 'students_datatable', format: :json
    end

    it 'expect to be json' do
      assert_response :success
    end
  end
end
