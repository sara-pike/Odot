require 'spec_helper'

  describe "Deleting to do lists" do
    let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery List") }

  it "is successful when clicking the destroy link" do
      visit "/todo_lists"

      within "#todo_list_#{todo_list.id}" do
        click_link "Destroy"
      end
      expect(page).to_not have_content(todo_list.title)
      expect(TodoList.count).to eq(0)

  end
end