require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card,
        :definition => "Definition",
        :object_type => "Object Type",
        :example => "MyText",
        :return_type => "Return Type",
        :category => "Category"
      ),
      stub_model(Card,
        :definition => "Definition",
        :object_type => "Object Type",
        :example => "MyText",
        :return_type => "Return Type",
        :category => "Category"
      )
    ])
  end

  it "renders a list of cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Definition".to_s, :count => 2
    assert_select "tr>td", :text => "Object Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Return Type".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
