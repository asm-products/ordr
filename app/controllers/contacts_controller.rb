class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]
  before_action :load_contactable
  before_action :set_job

  def index
    @contacts = @contactable.contacts
  end

  def show
  end

  def new
    @contact = @contactable.contacts.new
  end

  def edit
  end

  def create
    @contact = @contactable.contacts.new(contact_params)
    if @contact.save
      redirect_to [@contactable.job, @contactable], notice: "Contact added."
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @contactable)
      render template: "#{@resource}/show"
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contactable, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contactable }
      else
        format.html { render :edit }
        format.json { render json: @contactable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to @contactable, notice: "Contact was successfully deleted."}
      format.json {head :no_content }
    end
  end

  private

  def load_contactable
    resource, id = request.path.split('/')[3..4]
    @contactable = resource.singularize.classify.constantize.find(id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def contact_params
    params.require(:contact).permit(:name, :company, :phone, :email, :linkedin_url)
  end

end
