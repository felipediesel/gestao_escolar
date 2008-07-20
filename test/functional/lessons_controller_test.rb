require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:lessons)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_lesson
    assert_difference('Lesson.count') do
      post :create, :lesson => { }
    end

    assert_redirected_to lesson_path(assigns(:lesson))
  end

  def test_should_show_lesson
    get :show, :id => lessons(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => lessons(:one).id
    assert_response :success
  end

  def test_should_update_lesson
    put :update, :id => lessons(:one).id, :lesson => { }
    assert_redirected_to lesson_path(assigns(:lesson))
  end

  def test_should_destroy_lesson
    assert_difference('Lesson.count', -1) do
      delete :destroy, :id => lessons(:one).id
    end

    assert_redirected_to lessons_path
  end
end
