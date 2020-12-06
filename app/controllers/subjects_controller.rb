class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  # before_action : authenticate_user!

  # GET /subjects
  # GET /subjects.json
  def index
    # @subjects = Subject.all

    if not current_user
      redirect_to new_user_session_path
    end
    
    # @subjects = User&.find_by_id(current_user.id)&.subjects

    
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new

  end

  # GET /subjects/1/edit
  def edit
    
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

   

    respond_to do |format|
       for i in current_user.subjects do
        if @subject.subject == i.subject
          i.marks += @subject.marks
          subject_params = {"subject" => i.subject,"marks" => i.marks,"user_id" => i.user_id}
          i.update(subject_params)
          redirect_to @subject and return
        end

        end
      @subject.user_id = current_user.id
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end


  # def create
  #   @subject = Subject.new(subject_params)

  #   for i in current_user.subjects do
  #     if @subject.subject == i
  #       @subject.marks = i.marks + @subject.marks
  #       @subject.update
  #     end
  #   end

  #   respond_to do |format|
  #     if @subject.save
  #       format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
  #       format.json { render :show, status: :created, location: @subject }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @subject.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:subject, :marks, :user_id)
    end
end
