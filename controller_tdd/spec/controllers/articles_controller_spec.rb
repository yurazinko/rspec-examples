require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET index" do
    it "assigns all articles as @articles" do
      article = Article.create!(title: "valid title")
      get :index
      assert_response :success
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      article = Article.create!(title: "valid title")
      get :show, params: {id: article.to_param}
      assert_response :success
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      article = Article.create!(title: "valid title")
      get :edit, params: {id: article.to_param}
      assert_response :success
    end
  end

  describe "POST create" do
    it "creates a new article" do
      expect {post :create, params: {article: {title: 'valid title'}}}.to change(Article, :count).by(1)
    end

    it "assigns a newly created article as @article" do
      post :create, params: {article: {title: 'valid title'}}
      expect(assigns(:article)).to be_a(Article)
      expect(assigns(:article)).to be_persisted
    end

    it "redirects to the created article" do
      post :create, params: {:article => {title: 'valid title'}}
      expect(response).to redirect_to(Article.last)
    end
  end

  #deprecated example
  it "assigns a newly created but unsaved article as @article with invalid parameters" do
    allow(Article.any_instance).to have_received(:save).and_return(false)
    post :create, params: {article: { title: "invalid value" }}
    expect(assigns(:article)).to be_a_new(Article)
  end
end
