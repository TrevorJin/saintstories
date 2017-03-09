require 'test_helper'

class TimelineEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeline_event = timeline_events(:one)
  end

  # test "should get index" do
  #   get timeline_events_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_timeline_event_url
  #   assert_response :success
  # end

  # test "should create timeline_event" do
  #   assert_difference('TimelineEvent.count') do
  #     post timeline_events_url, params: { timeline_event: { event_description: @timeline_event.event_description, image: @timeline_event.image, image_alternative_text: @timeline_event.image_alternative_text, image_caption: @timeline_event.image_caption, image_description: @timeline_event.image_description } }
  #   end

  #   assert_redirected_to timeline_event_url(TimelineEvent.last)
  # end

  # test "should show timeline_event" do
  #   get timeline_event_url(@timeline_event)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_timeline_event_url(@timeline_event)
  #   assert_response :success
  # end

  # test "should update timeline_event" do
  #   patch timeline_event_url(@timeline_event), params: { timeline_event: { event_description: @timeline_event.event_description, image: @timeline_event.image, image_alternative_text: @timeline_event.image_alternative_text, image_caption: @timeline_event.image_caption, image_description: @timeline_event.image_description } }
  #   assert_redirected_to timeline_event_url(@timeline_event)
  # end

  # test "should destroy timeline_event" do
  #   assert_difference('TimelineEvent.count', -1) do
  #     delete timeline_event_url(@timeline_event)
  #   end

  #   assert_redirected_to timeline_events_url
  # end
end
