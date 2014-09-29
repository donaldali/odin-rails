class KittensController < ApplicationController
	respond_to :html, :json

	def index
		@kittens = Kitten.all

		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: @kittens }
		# end
		respond_with @kittens
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)

		if @kitten.save
			flash[:success] = "Kittten #{@kitten.name} created"
			redirect_to @kitten
		else
			render 'new'
		end
	end

	def show
		@kitten = Kitten.find(params[:id])

		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: @kitten }
		# end
		respond_with @kitten
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update(kitten_params)
			flash[:success] = "Kitten #{@kitten.name} updated"
			redirect_to @kitten
		else
			render 'edit'
		end
	end

	def destroy
		@kitten = Kitten.find(params[:id])
		kitten_name = @kitten.name
		@kitten.destroy
		redirect_to kittens_path, notice: "Kitten #{kitten_name} deleted"
	end

	private

	  def kitten_params
	  	params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	  end

end
