require 'spec_helper'

describe Kitten do
	let(:kitten) { create(:kitten) }
	subject { kitten }

	it { should be_valid }
	it { should respond_to(:name) }
	it { should respond_to(:age) }
	it { should respond_to(:cuteness) }
	it { should respond_to(:softness) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:age) }
end
