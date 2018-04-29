class Api::V1::NodesController < Api::ApiController
  before_action :set_node, only: [:show, :edit, :update, :destroy]
  before_action :check_token

  # GET /nodes
  # GET /nodes.json
  def index
    if(params.has_key?(:floor) && params.has_key?(:building))
      @nodes = Node.where(:floor => params[:floor],:building => params[:building])
    elsif(params.has_key?(:floor).present?)
      @nodes = Node.where(:floor => params[:floor])
    elsif(params.has_key?(:building).present?)
        @nodes = Node.where(:building => params[:building])
    else
      @nodes = Node.all
    end

    respond_to do |format|
      format.any { render json: @nodes, content_type: 'application/json' }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    if(params.has_key?(:children))
       if(params[:children] == "true")
         @node = Node.find(params[:id]).children
       end
     else
       @node = Node.find(params[:id])
    end
    render json: @node
  end

  # GET /nodes/new
  def new
    @node = Node.new
  end

  # GET /nodes/1/edit
  def edit
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(node_params)

    respond_to do |format|
      if @node.save
        format.html { redirect_to @node, notice: 'Node was successfully created.' }
        format.json { render :show, status: :created, location: @node }
      else
        format.html { render :new }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nodes/1
  # PATCH/PUT /nodes/1.json
  def update
    respond_to do |format|
      if @node.update(node_params)
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
        format.json { render :show, status: :ok, location: @node }
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node.destroy
    respond_to do |format|
      format.html { redirect_to nodes_url, notice: 'Node was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_params
      params.require(:node).permit(:room_name, :room_number, :room_capacity, :x, :y, :floor, :building, {:child_ids =>[]})
    end
end
