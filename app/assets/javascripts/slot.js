//= require lodash

// $(document).on("ready page:load", function() {

// });

(function() {

	window.lo = window.lo || {};
	lo.initSlot = function(students) {
		var $btnMove = $('#btnMove');
		var $list = $('#list');
		var $userName = $('#userName');

		$btnMove.on('click', function() {
			slotGo();
		});

		function init() {

			var html = "";
			// _.times(20, function(n) {
			// 	html += "<li>" + "<img src='http://www.avatarpro.biz/avatar?=" + n + "' alt='' />" + "</li>"
			// });
			html = _.chain(students).map(function(student) {
				return "<li>" + "<img class='student-avatar' src='" + student.avatar + "' alt='" + student.name + "' />" + "</li>";
			}).reduce(function(html, item) {
				return html + item;
			}, html).value();
			$list.html(html + html);
		}

		var current = 0;
		var intervalID;
		var currentStudentName;

		function slotGo() {
			var count = students.length;
			var liHeight = $list.find('li').first().height();
			$list.css("margin-top", "0px");
			var currentStudent = Math.floor(Math.random());
			currentStudentName = students[currentStudent].name;

			var limit = liHeight * Math.floor(count + currentStudent * count);
			var position = "-" + limit + "px";
			$list.animate({
				'margin-top': position
			}, 3000, function() {
				console.log('@@');

				$userName.text(currentStudentName);
			});
		}

		init();

	};



})();