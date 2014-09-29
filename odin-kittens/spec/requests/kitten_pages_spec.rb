require 'spec_helper'

describe "Kitten pages" do
	let(:kitten) { create(:kitten) }
	subject { page }


	describe 'index' do
		let!(:kitten) { create(:kitten) }
		before do
		  visit kittens_path
		end

		it { should have_title('Odin Kittens') }
		it { should have_selector('h1', text: 'All Kittens') }
		it { should have_link(  'Edit', href: edit_kitten_path(kitten)) }
		it { should have_link('Delete', href: kitten_path(kitten)) }

		it "allows destruction of kittens :-(" do
			expect{click_on('Delete')}.to change{Kitten.count}.by(-1)
		end

		describe 'nav bar' do
			let(:navbar) { find('.navbar') }
			subject { navbar }

			it { should have_text('Odin Kittens') }
			it { should have_link('All Kittens', href: kittens_path) }
			it { should have_link('New Kitten',  href: new_kitten_path) }
		end
	end

	describe 'new' do
		before { visit new_kitten_path }

		describe 'page' do 
			it { should have_title(   'Odin Kittens') }
			it { should have_selector('h1', text: 'Create Kitten') }
			it { should have_field(   'Name') }
			it { should have_field(   'Age') }
			it { should have_field(   'Cuteness') }
			it { should have_field(   'Softness') }
			it { should have_submit(  'Create Kitten') }
		end

		describe 'with incomplete information' do
		  it 'does not create kitten' do
		  	expect{click_on('Create Kitten')}.not_to change{Kitten.count}
		  end

		  it 'displays error message' do
		  	click_on('Create Kitten')
		  	expect(page).to have_text('error')
		  end
	  end

	  describe 'with complete information' do
	  	before { fill_form }

	  	it 'creates a kitten' do 
	  		expect{click_on('Create Kitten')}.to change{Kitten.count}.by(1)
	  	end

	  	it 'displays creation information' do 
	  		click_on('Create Kitten')
	  		expect(page).to have_css( '.alert.alert-success')
	  		expect(page).to have_text('fluffy')
	  	end
	  end
	end

	describe 'edit' do
		before { visit edit_kitten_path(kitten) }

		describe 'page' do
			it { should have_title(   'Odin Kittens') }
			it { should have_selector('h1', text: 'Edit Kitten') }
			it { should have_field(   'Name', with: 'salem') }
			it { should have_field(   'Age', with: '5') }
			it { should have_field(   'Cuteness') }
			it { should have_field(   'Softness') }
			it { should have_submit(  'Update Kitten') }
			it { should have_link(    'Delete Kitten') }
		end

		describe 'with invalid information' do
			before do
			  fill_form_incorrectly
			  click_on('Update Kitten')
			end

			it 'does not update kitten' do
				expect(kitten.name).to eq('salem')
			end

			it 'displays error message' do
				expect(page).to have_text('error')
			end
		end

		describe 'with valid information' do
			before do
			  fill_form
			  click_on('Update Kitten')
			end

			it 'updates kitten' do
				expect(kitten.reload.name).to eq('fluffy')
			end

			it 'displays update message' do
	  		expect(page).to have_css('.alert.alert-success')
			end
		end

		it "allows destruction of kittens :-(" do
			expect{click_on('Delete')}.to change{Kitten.count}.by(-1)
		end
	end

	describe 'show' do
		before { visit kitten_path(kitten) }

		it { should have_title('Odin Kittens') }
		it { should have_selector('h1', text: 'Kitten Information') }
		it { should have_text('Name') }
		it { should have_text('Age') }
		it { should have_text('Cuteness') }
		it { should have_text('Softness') }
		it { should have_link('Delete', href: kitten_path(kitten)) }
		it { should have_link('Edit',   href: edit_kitten_path(kitten)) }
	end
end
