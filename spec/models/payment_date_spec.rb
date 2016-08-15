require 'rails_helper'

RSpec.describe PaymentDate, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :scheduled_at }
    it { is_expected.to validate_uniqueness_of :scheduled_at }
  end

  describe 'database columns' do
    it { should have_db_column :scheduled_at }
  end

  describe 'associations' do
    it { is_expected.to have_many(:payments)}
  end
end
