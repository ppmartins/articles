class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to topic_articles
    else
      flash.now[:alert] = "Error creating the topic. Please try again."
      redirect_to new_topic
    end
  end
end
