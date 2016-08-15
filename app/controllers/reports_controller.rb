class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }

  def subjects
  end

  def payments
  end

  def students_datatable
    respond_to do |format|
      format.json {render json: StudentsDatatable.new(view_context) }
    end
  end

end
