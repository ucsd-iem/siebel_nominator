class NominationsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  
  def download_letter
    @nomination = Nomination.find(params[:nomination_id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin
         # file = File.new(@document.document.path, "r")
         # send_data(file.read,
         #  :filename     =>  @document.document_file_name,
         #  :type         =>  @document.document_content_type,
         #  :disposition  =>  'inline') 
       
    send_file @nomination.nominator_letter.path, :type => @nomination.nominator_letter_content_type, :disposition => 'inline'
  end
  
  def download_resume
    @nomination = Nomination.find(params[:nomination_id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin
    
    send_file @nomination.nominee_resume.path, :type => @nomination.nominee_resume_content_type, :disposition => 'inline'  
  end

  def download_transcript
    @nomination = Nomination.find(params[:nomination_id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin
    
    send_file @nomination.nominee_transcript.path, :type => @nomination.nominee_transcript_content_type, :disposition => 'inline'    
  end


  def download_statement
    @nomination = Nomination.find(params[:nomination_id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin
    
    send_file @nomination.nominee_statement.path, :type => @nomination.nominee_statement_content_type, :disposition => 'inline'    
  end

  def download_misc
    @nomination = Nomination.find(params[:nomination_id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin
    
    send_file @nomination.misc_document.path, :type => @nomination.misc_document_content_type, :disposition => 'inline'    
  end
  
  # GET /nominations
  # GET /nominations.xml
  def index
    if current_user.admin
      @nominations = Nomination.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])      
    else
      @nominations = Nomination.where(:user_id => current_user).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nominations }
    end
  end

  # GET /nominations/1
  # GET /nominations/1.xml
  def show
    @nomination = Nomination.find(params[:id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin
    
    if Time.now < Settings.deadline
      respond_to do |format|
        format.html { render 'errors/404', :status => 404 unless @nomination}# show.html.erb
        format.xml  { render :xml => @nomination }
      end
    else
      redirect_to(root_path, :notice => 'Sorry, you can no longer edit nominations') unless current_user
    end
  end

  # GET /nominations/new
  # GET /nominations/new.xml
  def new
    if Time.now < Settings.deadline
      @nomination = current_user.nominations.build

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @nomination }
      end
    else
      redirect_to(root_path, :notice => 'We are no longer accepting new nominations')
    end
  end

  # GET /nominations/1/edit
  def edit
    @nomination = Nomination.find(params[:id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin

    if Time.now < Settings.deadline
      redirect_to(root_path, :error => "We could not find a nomination by that token, please check the link and try again") unless @nomination
    else
      redirect_to(root_path, :notice => 'Sorry, you can no longer edit nominations') unless current_user
    end
  end

  # POST /nominations
  # POST /nominations.xml
  def create
    @nomination = current_user.nominations.create(params[:nomination])

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to(thanks_url, :info => 'Nomination was successfully created.') }
        format.xml  { render :xml => @nomination, :status => :created, :location => @nomination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nominations/1
  # PUT /nominations/1.xml
  def update
    @nomination = Nomination.find(params[:id])
    @nomination = nil unless current_user.nominations.include?(@nomination) || current_user.admin

    respond_to do |format|
      if @nomination.update_attributes(params[:nomination])
        @nomination.update_nominator
        
        format.html { redirect_to(@nomination, :notice => 'Nomination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nomination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.xml
  def destroy
    @nomination = Nomination.find(params[:id])
    @nomination.destroy if current_user.nominations.include?(@nomination) || current_user.admin

    respond_to do |format|
      format.html { redirect_to nominations_url, :notice => "Nomination was deleted." }
      format.xml  { head :ok }
    end
  end

  private
  
  def sort_column
    Nomination.column_names.include?(params[:sort]) ? params[:sort] : "nominee_lastname"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
