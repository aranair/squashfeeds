class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit_list, :update_list, :update, :destroy]

  before_action :set_grade, only: [:update_list, :edit_list, :index]
  before_action :set_teams_by_grade, only: [:update_list, :edit_list, :index]

  def update_list
    @teams = Team.update(params[:teams].keys, params[:teams].values).reject { |p| p.errors.empty? }
    if @teams.empty?
      flash[:notice] = "Scores updated"
      redirect_to teams_path(grade: @grade)
    else
      render :action => "edit_individual"
    end
  end

  def edit_list
  end

  def index
  end

  # def show
  # end

  # def new
  #   @team = Team.new
  # end

  def edit
    @teams = Team.for_grade(params[:grade])
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # respond_to do |format|
    #   if @team.update(team_params)
    #     format.html { redirect_to @team, notice: 'Team was successfully updated.' }
    #     format.json { render action: 'show', status: :ok, location: @team }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @team.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /teames/1
  # DELETE /teames/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teames_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def set_grade
      @grade = (params[:grade].presence && params[:grade].downcase) || 'a'
    end
    
    def set_teams_by_grade
      @teams = Team.for_grade(@grade)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :points_a, :points_b, :points_c, :points_d, :points_e, :points_f, :grade)
    end
end
