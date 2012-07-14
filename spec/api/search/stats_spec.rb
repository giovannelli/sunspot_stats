require File.expand_path('spec_helper', File.dirname(__FILE__))

describe 'stats', :type => :search do
  it 'returns field name for facet' do
    #stub_stat(:visibility)
    result = session.search Content do
      stat :visibility, :facet => :published_at
    end

    result.stat(:visibility).field_name.should == :visibility
  end

end
