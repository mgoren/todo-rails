require 'rails_helper'

describe Task do
  it {should validate_presence_of :description }
  it {should belong_to :list }

  describe '.done' do
    it "returns all tasks that are done" do
      test_list = List.create(name: "Test List", description: "testy")
      test_task = test_list.tasks.create(description: "fun", done: true)
      test_task_2 = test_list.tasks.create(description: "funny", done: false)
      expect(Task.done).to eq([test_task])
    end
    it "returns all tasks that are not done" do
      test_list = List.create(name: "Test List", description: "testy")
      test_task = test_list.tasks.create(description: "fun", done: true)
      test_task_2 = test_list.tasks.create(description: "funny", done: false)
      expect(Task.not_done).to eq([test_task_2])
    end

  end
end
