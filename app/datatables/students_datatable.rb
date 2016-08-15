class StudentsDatatable
  include ReportsHelper
  include ActionView::Helpers::TagHelper  
  include ActionView::Context

  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Student.count,
      iTotalDisplayRecords: students.total_entries,
      aaData: data
    }
  end

private

  def data
    students.map do |student|
      [
        link_to(student.last_name, student),
        student.first_name,
        payment_table(student.payments)
      ]
    end
  end

  def students
    @students ||= fetch_students
  end

  def fetch_students
    students = Student.includes(:payments)
    students = students.order("#{sort_column} #{sort_direction}") if sort_column
    students = students.page(page).per_page(per_page)
    if params[:sSearch].present?
      students = students.where("first_name like :search or last_name like :search",
                               search: "%#{params[:sSearch]}%")
    end
    students
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[last_name first_name]
    limit = columns.length
    return nil if params[:iSortCol_0].to_i > limit
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end