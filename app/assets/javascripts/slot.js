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
		var currentStudent;

		function slotGo() {
			var count = students.length;
			var liHeight = $list.find('li').first().height();
			$list.css("margin-top", "0px");
			var currentStudentIdx = Math.floor(Math.random());
			currentStudent = students[currentStudentIdx];
			var limit = liHeight * Math.floor(count + currentStudentIdx * count);
			var position = "-" + limit + "px";
			$list.animate({
				'margin-top': position
			}, 1000, function() {
				
				console.log(currentStudent)				
				var UserNamehtml = "<a href='/users/" + currentStudent.id + "' >" + currentStudent.name+"</a>";
				$userName.html(UserNamehtml);
			});
		}

		init();

	};



})();