ActiveAdminDatetimepicker::Base.default_datetime_picker_options = {
    format: 'Y-m-d H:i',
    defaultTime: proc { Time.current.strftime('%H:00') }
}
ActiveAdminDatetimepicker::Base.format = '%Y-%m-%d %H:%M'

