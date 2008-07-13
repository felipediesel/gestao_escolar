require 'test_helper'

class InstructorsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instructors)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_instructor
    assert_difference('Instructor.count') do
      post :create, :instructor => { }
    end

    assert_redirected_to instructor_path(assigns(:instructor))
  end

  def test_should_show_instructor
    get :show, :id => instructors(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => instructors(:one).id
    assert_response :success
  end

  def test_should_update_instructor
    put :update, :id => instructors(:one).id, :instructor => { }
    assert_redirected_to instructor_path(assigns(:instructor))
  end

  def test_should_destroy_instructor
    assert_difference('Instructor.count', -1) do
      delete :destroy, :id => instructors(:one).id
    end

    assert_redirected_to instructors_path
  end
end
