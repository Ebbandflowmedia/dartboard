class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render action: 'show', status: :created, location: @score }
      else
        format.html { render action: 'new' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url }
      format.json { head :no_content }
    end
  end

  def hit
    @score = Score.find(hit_params[:id])
    @match = Match.find(@score.match_id)
    @otherScore = Score.where(:match_id => @match.id).where.not(:id => @score.id)

    num = hit_params[:num]
    num_under = 'num_' + num.to_s
    status_under = 'status_' + num.to_s

    #check status of target, and update if necesarry
    if @score.read_attribute(num_under) >= 3 && @otherScore.first.read_attribute(num_under) >= 3
      @score[status_under] = 1
      @otherScore.first[status_under] = 1
    end


    if @score.read_attribute(status_under) == false
      #if target is still open, record it, and record hits.
      number = @score.read_attribute(num_under) + hit_params[:factor].to_i
      hits = @score.hits + hit_params[:factor].to_i

      #  
      # if @score.read_attribute(num_under) >= 3
      #  #if player has scored 3 of this type already, add some points to their score
      #    @score.score = @score.score + (num.to_i * hit_params[:factor].to_i)
      # elsif @score.read_attribute(num_under) == 2
      #
      #   @score.score = @score.score + (num.to_i * (hit_params[:factor].to_i - 1)
      # 
      # elsif @score.read_attribute(num_under) == 1
      #
      #    @score.score = @score.score + (num.to_i * (hit_params[:factor].to_i - 2)
      # end

    else
      #if target is closed, don't record hits or points.
      number = @score.read_attribute(num_under)
      hits = @score.hits
    end

    @score[num_under] = number
    @score.hits = hits.to_i


    @newScore = 0


    (15..20).each do |score_num|
      score_num_under = 'num_' + score_num.to_s

      if @score[score_num_under] >= 3
        @newScore = @newScore + ((@score[score_num_under] - 3)* score_num.to_i)
      end

    end

      if @score.num_25 >= 3
        @newScore = @newScore + ((@score.num_25 - 3) * 25)
      end


      @score.score = @newScore; 

    if @score.read_attribute(num_under) >= 3 && @otherScore.first.read_attribute(num_under) >= 3
      @score[status_under] = 1
      @otherScore.first[status_under] = 1
    end
    

    respond_to do |format|
      if @score.save && @otherScore.first.save
        format.html { redirect_to @score.match, notice: 'Score was successfully updated. Number of ' + hit_params[:num].to_s + 's = ' + number.to_s}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params[:score].permit(:num_20, :num_19, :num_18, :num_17, :num_16, :num_15, :status, :hits, :shots)
    end

    def hit_params
      params.permit(:id, :num, :factor, :num_20, :num_19, :num_18, :num_17, :num_16, :num_15, :status, :hits, :shots)
    end
end
