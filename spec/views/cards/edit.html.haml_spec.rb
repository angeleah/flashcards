require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :definition => "MyString",
      :object_type => "MyString",
      :example => "MyText",
      :return_type => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_definition[name=?]", "card[definition]"
      assert_select "input#card_object_type[name=?]", "card[object_type]"
      assert_select "textarea#card_example[name=?]", "card[example]"
      assert_select "input#card_return_type[name=?]", "card[return_type]"
      assert_select "input#card_category[name=?]", "card[category]"
    end
  end
end
