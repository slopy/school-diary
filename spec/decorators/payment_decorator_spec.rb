require 'rails_helper'

describe PaymentDecorator do
  let!(:payment) { build :payment }
  let!(:payment_paid) { build :payment, paid_at: Date.today }

  describe '#paid' do

    describe "when not paid" do
      subject { payment.decorate.paid }
      it { is_expected.to eq 'No' }
    end

    describe "when paid" do
      subject { payment_paid.decorate.paid }
      it { is_expected.to eq 'Yes' }
    end

  end

  describe '#paid_at' do

    describe "when not paid" do
      subject { payment.decorate.paid_at }
      it { is_expected.to eq '-' }
    end

    describe "when paid" do
      subject { payment_paid.decorate.paid_at }
      it { is_expected.to eq Date.today }
    end

  end
end