require 'spec_helper'

describe "tasks/new.html.erb" do
  before(:each) do
    assign(:task, stub_model(Task,
      :name => "MyString",
      :user_id => 1,
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_user_id", :name => "task[user_id]"
      assert_select "textarea#task_note", :name => "task[note]"
    end
  end
end
