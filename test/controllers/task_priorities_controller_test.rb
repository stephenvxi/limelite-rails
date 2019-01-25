require 'test_helper'

class TaskPrioritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_priority = task_priorities(:one)
  end

  test "should get index" do
    get task_priorities_url
    assert_response :success
  end

  test "should get new" do
    get new_task_priority_url
    assert_response :success
  end

  test "should create task_priority" do
    assert_difference('TaskPriority.count') do
      post task_priorities_url, params: { task_priority: {  } }
    end

    assert_redirected_to task_priority_url(TaskPriority.last)
  end

  test "should show task_priority" do
    get task_priority_url(@task_priority)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_priority_url(@task_priority)
    assert_response :success
  end

  test "should update task_priority" do
    patch task_priority_url(@task_priority), params: { task_priority: {  } }
    assert_redirected_to task_priority_url(@task_priority)
  end

  test "should destroy task_priority" do
    assert_difference('TaskPriority.count', -1) do
      delete task_priority_url(@task_priority)
    end

    assert_redirected_to task_priorities_url
  end
end
