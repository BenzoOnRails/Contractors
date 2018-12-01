class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.all
  end

  # GET /contractors/1
  # GET /contractors/1.json
  def show
  end

  # GET /contractors/new
  def new
    @contractor = Contractor.new
  end

  # GET /contractors/1/edit
  def edit
  end

  # POST /contractors
  # POST /contractors.json
  def create
    uploaded_io = params[:contractor][:file]
    filepath = Rails.root.join('public', uploaded_io.original_filename)

    upload_file(filepath, uploaded_io)

    puts contractor_params
    @contractor = Contractor.new(contractor_params)
    @contractor.file = uploaded_io.original_filename     
    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: 'Contractor was successfully created.' }
        format.json { render :show, status: :created, location: @contractor }
      else
        format.html { render :new }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractors/1
  # PATCH/PUT /contractors/1.json
  def update
    uploaded_io = params[:contractor][:file]
    filepath = Rails.root.join('public', uploaded_io.original_filename)

    upload_file(filepath, uploaded_io)

    puts contractor_params
    @contractor = Contractor.find(params[:id])
    @contractor.file = uploaded_io.original_filename
      if @contractor.update(contractor_params)
        format.html { redirect_to @contractor, notice: 'Contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @contractor }
      else
        format.html { render :edit }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
  end


  def upload_file(filepath, uploaded_io)
    File.open(filepath, 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.json
  def destroy
    @contractor.destroy
    respond_to do |format|
      format.html { redirect_to contractors_url, notice: 'Contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor = Contractor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor).permit(:name, :cv, :rate)
    end
end
