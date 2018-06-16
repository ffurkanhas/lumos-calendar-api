class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :end_date, :reminder, :recurring
end
