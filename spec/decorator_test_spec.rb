require './decorator'

describe 'Nameable' do
  it 'Rises a NotImplementedError' do
    nameable = Nameable.new

    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end

describe 'BaseDecorator' do
  it 'Rises a NotImplementedError' do
    base_decorator = BaseDecorator.new(Nameable.new)

    expect { base_decorator.correct_name }.to raise_error(NotImplementedError)
  end
end

