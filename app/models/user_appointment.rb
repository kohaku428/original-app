class UserAppointment
  include ActiveModel::Model
  attr_accessor :user_id, :hairdresser_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :full_name, :day, :time

  with_options presence: true do
    validates :time
    validates :day
    validates :full_name
    validates :user_id
    validates :hairdresser_id
    validates :city
    validates :house_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :telephone, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
  end
  
  def save
    appointment = Appointment.create(user_id: user_id, hairdresser_id: hairdresser_id, day: day, time: time)
    Address.create(full_name: full_name, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone, appointment_id: appointment.id, )
  end
end
