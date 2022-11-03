class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show update destroy ]

  # GET /reviews
  def index
    @reviews = current_user.reviews

    render json: ReviewSerializer.new(@reviews)
  end

  # GET /reviews/1
  def show
    render json: ReviewSerializer.new(@review)
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      update_hero(@review.score )
      render json: ReviewSerializer.new(@review), status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update( review_params )
      update_hero(@review.score )
      render json: ReviewSerializer.new(@review)
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[ :id ])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit( :text, :score, :user_id, :hero_id )
    end

    def update_hero(score)
      hero = Hero.find(hero_id)
      hero.update_hero_score(score)
    end

   
end
