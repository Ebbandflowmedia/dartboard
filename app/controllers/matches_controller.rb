class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    @players = params[:match][:user_ids]

    ##Add the Users to the Match
    @players.each do |player_id|
      if player_id != ""
        @user = User.find(player_id)
        @match.users << @user
      end
    end

    ##Create a scorecard for each User
    @match.users.each do |player|

      @score = Score.new(user: player, match: @match, score: 0)
      @score.save

    end

    @match.shooter_id = @match.users.first.id

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match }
      else
        format.html { render action: 'new' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end


  def switch_shooter
    @match = Match.find(switch_params[:id])

    @curShooter = User.find(switch_params[:shooter_id])
    @curScore = @match.scores.where(:user_id => @curShooter).first

    @nextShooter = @match.users.where.not(:id => @curShooter.id)#User.where(:matches => @match.id).where.not(:id => @curShooter.id)

    #add shots to current shooter score
    @curScore.shots = @curScore.shots + 3

    #switch shooters
    @match.shooter_id = @nextShooter.first.id

    respond_to do |format|
      if @match.save && @curScore.save
        format.html { redirect_to @match, notice: 'Next Players Turn'}
        format.json { render action: 'show', status: :created, location: @match }
      else
        format.html { render action: 'new' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params[:match].permit(:users, :user_ids)
    end
    def switch_params
      params.permit(:id, :shooter_id)
    end
end
