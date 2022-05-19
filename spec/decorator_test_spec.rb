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

describe 'CapitalizeDecorator' do
  it 'Rises a NotImplementedError' do
    capitalize_decorator = CapitalizeDecorator.new(Nameable.new)

    expect { capitalize_decorator.correct_name }.to raise_error(NotImplementedError)
  end
end

describe 'TrimmerDecorator' do
  it 'Rises a NotImplementedError' do
    trimmer_decorator = TrimmerDecorator.new(Nameable.new)

    expect { trimmer_decorator.correct_name }.to raise_error
  end
end
