require './classroom_class'

describe 'Classroom' do
  it 'creates a classroom with the correct parameters' do
    classroom = Classroom.new('A-1')

    expect(classroom.label).to eq('A-1')
  end
end
