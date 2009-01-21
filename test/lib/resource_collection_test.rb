require File.join(File.dirname(__FILE__), "..", "test_helper")

class ResourceCollectionTest < Test::Unit::TestCase
  context "collections" do
    setup do
      @books = [
        ResourceFactory.build(:nonfiction_book),
        ResourceFactory.build(:nonfiction_book)
      ]
      
      @collection = ResourceCollection.build(@books)
    end
    
    should "have a header that reflects the pluralized resource type" do
      assert_match(/<nonfiction-books>/, @collection.to_xml)
    end
    
    should "contain each items' xml" do
      @books.each do |b|
        assert_match(/#{b.to_xml}/, @collection.to_xml)
      end
    end
  end
end