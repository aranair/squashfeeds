class StandingsController < ApplicationController
  before_action :set_grade, only: [:edit, :update]

  def show
    @teams = Team.for_grade(params['grade'])
  end

  def edit
    @teams = Team.for_grade(params['grade'])
  end

  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @match }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = params[:grade].downcase
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def team_params
    #   params.require(:team).permit(:name, :points_a, :points_b, :points_c, :points_d, :points_e, :points_f, :grade)
    # end
  
end
