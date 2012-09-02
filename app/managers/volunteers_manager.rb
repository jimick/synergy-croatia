class VolunteersManager < BaseManager
  def create(attributes)
    volunteer = Volunteer.new(attribute)

    if volunteer.valid?
      VolunteeringMailer.volunteer(volunteer).deliver
      create_succeeded(volunteer)
    else
      create_failed(volunteer)
    end
  end
end