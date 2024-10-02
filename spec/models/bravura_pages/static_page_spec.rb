# spec/models/bravura_pages/static_page_spec.rb
module BravuraPages
  RSpec.describe StaticPage, type: :model do
    let(:account) { build_stubbed(:account) }  # Stub for speed
    let(:author) { build_stubbed(:user) }      # Stub for speed

    subject { described_class.new(title: "Test Page", content: "Test Content", account: account, author: author) }

    describe 'associations' do
      it { is_expected.to belong_to(:account) }
      it { is_expected.to belong_to(:author).class_name('User') }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:content) }
    end

    # Switch to real database interaction when necessary
    describe 'scopes' do
      let!(:published_page) { create(:bravura_pages_static_page, :published, account: account, author: author) }
      let!(:draft_page) { create(:bravura_pages_static_page, :draft, account: account, author: author) }

      describe '.published' do
        it 'returns only published pages' do
          expect(described_class.published).to include(published_page)
          expect(described_class.published).not_to include(draft_page)
        end
      end

      describe '.draft' do
        it 'returns only draft pages' do
          expect(described_class.draft).to include(draft_page)
          expect(described_class.draft).not_to include(published_page)
        end
      end
    end

    describe 'friendly_id' do
      it 'generates a slug from the title' do
        page = create(:bravura_pages_static_page, title: 'My Awesome Page', account: account, author: author)
        expect(page.slug).to eq 'my_awesome_page'
      end

      it 'ensures slug uniqueness within an account' do
        create(:bravura_pages_static_page, title: 'My Page', account: account, author: author)
        new_page = create(:bravura_pages_static_page, title: 'My Page', account: account, author: author)
        expect(new_page.slug).to eq 'my_page_1'
      end
    end

    # Testing with acts_as_tenant requires real database interaction
    describe 'acts_as_tenant' do
      it 'scopes queries to the current tenant' do
        ActsAsTenant.with_tenant(account) do
          page = create(:bravura_pages_static_page, account: account, author: author)
          expect(described_class.all).to include(page)
        end

        other_account = create(:account)
        ActsAsTenant.with_tenant(other_account) do
          expect(described_class.all).not_to include(page)
        end
      end
    end
  end
end
