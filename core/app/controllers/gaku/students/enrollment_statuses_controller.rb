module Gaku
  class Students::EnrollmentStatusesController < GakuController
  	inherit_resources

  	respond_to :js, :html

    before_filter :load_enrollment_status
  	before_filter :load_student, :only => [:revert, :edit, :update]
  
  	def history
      @enrollment_status_history = @enrollment_status.history
      
      respond_with(@enrollment_status_history) do |format| 
  			format.js { render 'history' }
  		end
  	end

    def revert 
      @enrollment_status.revert unless @enrollment_status.audits.count.equal?(1)

      respond_with(@enrollment_status) do |format| 
        format.js { render 'revert' }
      end
    end

    private

    def load_enrollment_status
      @enrollment_status = EnrollmentStatus.find(params[:id])
    end

  	def load_student
  		@student = Student.find(params[:student_id])
  	end
  end
end