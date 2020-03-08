class InterlocutorValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    first_user = record.first_user
    second_user = record.second_user

    return record.errors.add(attribute, :invalid_company) if first_user.company != second_user.company
    return record.errors.add(attribute, :invalid) if first_user == second_user
    return record.errors.add(attribute, :taken) if chat_exists?(first_user, second_user)
  end

  private

  def chat_exists?(first_user, second_user)
    first_user.chat_with(user: second_user).present?
  end
end
