class SearchesController < ApplicationController

  def show
    @results = perform_search.results
  end

  private 

  def perform_search
    Sunsport.search(Shout::CONTENT_TYPES) do
      fulltext query
  end

  def query
    params[:search][:query]
  end

end