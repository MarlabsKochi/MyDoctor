module EntityHelper
  def destroy_entity(entity)
    entity.destroy
    respond_to do |format|
      format.html { redirect_to "/"+entity.class.table_name , notice: "#{entity.class.to_s.capitalize} was successfully destroyed" }
      format.json { head :no_content }
    end
  end
  
  def create_entity(entity, params)
    @entity = entity.new(params)

    respond_to do |format|
      if @entity.save
	    format.html { redirect_to "/"+entity.table_name, notice: "#{entity.to_s.capitalize} was successfully created" }
	    format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_entity(entity,params)
    respond_to do |format|
      if entity.update(params)
        format.html { redirect_to "/"+entity.class.table_name, notice: "#{entity.class.to_s.capitalize} was successfully updated" }
        format.json { render :show, status: :ok, location: entity }
      else
        format.html { render :edit }
        format.json { render json: entity.errors, status: :unprocessable_entity }
      end
    end
  end
end