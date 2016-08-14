class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    values = subject_item.subject_item_notes
                         .sum(:value)

    divider = subject_item.subject_item_notes
                          .count

    if values && divider > 0
      format("%.2f",values.to_f/divider.to_f)
    else
      format("%.2f",0)
    end
  end

  def birthdate
    object.birthdate.try(:strftime, "%Y-%m_%d")
  end
end
