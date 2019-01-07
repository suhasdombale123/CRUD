defmodule ChatWeb.Router do
  use ChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatWeb do
    pipe_through :browser

    get "/", RoomController, :index
    #get "/rooms/new", RoomController, :new
    #post "/rooms", RoomController, :create
    resources "/rooms", RoomController
    #get "/rooms/:id", RoomController, :show
    #get "/rooms/:id/edit", RoomController, :edit
    #put "/rooms/:id", RoomController, :update
    #delete "/rooms/:id", RoomController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatWeb do
  #   pipe_through :api
  # end
end
