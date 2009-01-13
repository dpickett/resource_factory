require File.join(File.dirname(__FILE__), "..", "test_helper")

class ResourceFactoryTest < Test::Unit::TestCase
  class PetResource < ActiveResource::Base

  end

  ResourceFactory.define(:nonfiction_book) do |p|
    p.name "The Pragmatic Programmer"
    p.author "David Thomas"
  end
  
  context "building with resource factory" do
    should "have default attributes" do
      book = ResourceFactory.build(:nonfiction_book)
      assert_not_nil book.attributes[:name]
    end
    
    should "have a header that reflects the resource type" do
      book = ResourceFactory.build(:nonfiction_book)
      assert_match /<nonfiction-book>/, book.to_xml
    end
    
    should "contain the attributes inside the root" do
      book = ResourceFactory.build(:nonfiction_book)
      assert_match /<name>#{book.attributes[:name]}<\/name>/, book.to_xml
      
    end
  end
  
end
