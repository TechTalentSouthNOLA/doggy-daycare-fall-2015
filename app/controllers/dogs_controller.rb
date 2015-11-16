class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :all_breeds, only: [:new, :edit]
  before_action :all_owners, only: [:new, :edit]

  # GET /dogs
  # GET /dogs.json
  def index
    # if we have the parameter, then only give me dogs that match
    if params[:search]
      @dogs = Dog.where("name LIKE ?", "%#{params[:search]}%")
      # if no dogs returns, give error message and list all dogs
      if @dogs.size.zero?
        flash[:notice] = "Sorry, no result found."
        @dogs = Dog.all
      end
    # else, give me all dogs
    else
      @dogs = Dog.all
    end
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def all_breeds
      @breeds = Breed.order("breed_name")
    end

    def all_owners
      @owners = Owner.order("last_name")
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :breed_id, :dob, :owner_id, :medical_conditions, :avatar, :in_daycare)
    end
end
