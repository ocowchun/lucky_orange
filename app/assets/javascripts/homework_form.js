$(document).on("ready page:load", function() {
	var $homework_deadline = $('#homework_deadline');
	var options = {
		dateFormat: 'yy-mm-dd'
	};
	$homework_deadline.datepicker(options);
});