require './decorator'

describe 'Nameable' do
  it 'Rises a NotImplementedError' do
    nameable = Nameable.new

    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
