$(function () {
    function getReport(form_name, report_path, format) {
        var country_dep_id = $('#' + form_name + '_report_country_dep_id').val(),
            city_dep_id = $('#' + form_name + '_report_city_dep_id').val(),
            airport_dep_id = $('#' + form_name + '_report_airport_dep_id').val(),
            dep_flight_date = $('#' + form_name + '_report_dep_flight_date').val(),
            country_arr_id = $('#' + form_name + '_report_country_arr_id').val(),
            city_arr_id = $('#' + form_name + '_report_city_arr_id').val(),
            airport_arr_id = $('#' + form_name + '_report_airport_arr_id').val(),
            arr_flight_date = $('#' + form_name + '_report_arr_flight_date').val();
        if (country_dep_id == null || city_dep_id == null ||
            country_dep_id == "" || city_dep_id == "" ||
            country_arr_id == null || city_arr_id == null ||
            country_arr_id == "" || city_arr_id == "") {
            alert('Please choose both Country and City from dropdowns');
        } else {
            var url = '/admin/fares/' + report_path +
                '?city_dep_id=' + city_dep_id +
                '&city_arr_id=' + city_arr_id +
                '&dep_flight_date=' + dep_flight_date +
                '&arr_flight_date=' + arr_flight_date + format;
            window.location.href = url;
        }
    }

    $('#fare_report_submit_action button').click(function (e) {
        e.preventDefault();
        getReport('fare', 'get_by_direction', '')
    });


});