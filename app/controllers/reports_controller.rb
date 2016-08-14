class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }

  def subjects
  end

  def payments
  end

  def students_datatable
  end

end
