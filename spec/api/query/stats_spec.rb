require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "stats component" do
  
  it "sends stats parameters to solr" do
    
    session.search Content do
      stat :visibility, :facet => :published_at
    end

    connection.should have_last_search_including(:stats, "true")
    connection.should have_last_search_including(:"stats.field", "visibility_f")
    connection.should have_last_search_including(:"stats.facet", "published_at_d")
  end
  
end