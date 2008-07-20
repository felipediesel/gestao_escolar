require 'test_helper'

class PresencesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:presences)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_presence
    assert_difference('Presence.count') do
      post :create, :presence => { }
    end

    assert_redirected_to presence_path(assigns(:presence))
  end

  def test_should_show_presence
    get :show, :id => presences(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => presences(:one).id
    assert_response :success
  end

  def test_should_update_presence
    put :update, :id => presences(:one).id, :presence => { }
    assert_redirected_to presence_path(assigns(:presence))
  end

  def test_should_destroy_presence
    assert_difference('Presence.count', -1) do
      delete :destroy, :id => presences(:one).id
    end

    assert_redirected_to presences_path
  end
end
