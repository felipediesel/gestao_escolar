require 'test_helper'

class ClassroomsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:classrooms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_classroom
    assert_difference('Classroom.count') do
      post :create, :classroom => { }
    end

    assert_redirected_to classroom_path(assigns(:classroom))
  end

  def test_should_show_classroom
    get :show, :id => classrooms(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => classrooms(:one).id
    assert_response :success
  end

  def test_should_update_classroom
    put :update, :id => classrooms(:one).id, :classroom => { }
    assert_redirected_to classroom_path(assigns(:classroom))
  end

  def test_should_destroy_classroom
    assert_difference('Classroom.count', -1) do
      delete :destroy, :id => classrooms(:one).id
    end

    assert_redirected_to classrooms_path
  end
end
