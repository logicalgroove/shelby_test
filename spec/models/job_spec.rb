require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { create(:job) }
  let(:correct_user) { create(:service_provider) }
  let(:wrong_user) { create(:service_provider) }

  it { should belong_to(:user) }
  it { should belong_to(:service_provider) }

  describe '#accepted_by?' do
    before { job.accept!(correct_user) }

    it 'returns true on correct user' do
      expect(job.accepted_by?(correct_user)).to eq true
    end

    it 'returns false on wrong user' do
      expect(job.accepted_by?(wrong_user)).to eq false
    end
  end

  describe '#accept!' do
    context 'provider not exist' do
      it 'sets sp to job' do
        expect{
          job.accept!(correct_user)
        }.to change(job, :provider_id).to correct_user.id
      end
    end

    context 'provider exists' do
      it 'does not set sp to job' do
        job.accept!(correct_user)

        expect{
          job.accept!(wrong_user)
        }.to_not change(job, :provider_id)
      end
    end
  end

  describe '#cancel!' do
    before { job.accept!(correct_user) }

    context 'correct user' do
      it 'removes sp from job' do
        expect{
          job.cancel!(correct_user)
        }.to change(job, :provider_id).to nil
      end
    end

    context 'wrong user' do
      it 'does not remove sp from job' do
        expect{
          job.cancel!(wrong_user)
        }.to_not change(job, :provider_id)
      end
    end
  end
end
