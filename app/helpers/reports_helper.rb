module ReportsHelper
  def payment_table(payments)

    columns = [:scheduled_at, :paid, :paid_at]
    
    thead = content_tag :thead do
      content_tag :tr do
        ths = ''
        columns.each do |column|  
          ths.concat content_tag(:th,column.to_s.humanize)
        end
        ths.html_safe
      end
    end

    tbody = content_tag :tbody do
      trs = ''
      payments.each do |elem|
        tds = ''
        tr = content_tag :tr do
          columns.each do |column|
            tds.concat content_tag(:td, elem.decorate.try(column))
          end
          tds.html_safe
        end
        trs.concat tr
      end
      trs.html_safe
    end

    content_tag :table, thead.concat(tbody)

  end
end