class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :userid, :title, :description, :start_date, :end_date, :reminder, :recurring
end
