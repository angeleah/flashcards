require 'spec_helper'

describe "cards/show" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :definition => "Definition",
      :object_type => "Object Type",
      :example => "MyText",
      :return_type => "Return Type",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Definition/)
    rendered.should match(/Object Type/)
    rendered.should match(/MyText/)
    rendered.should match(/Return Type/)
    rendered.should match(/Category/)
  end
end
