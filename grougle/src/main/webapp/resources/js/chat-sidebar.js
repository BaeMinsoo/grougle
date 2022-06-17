//Layout settings visible
		$('[data-toggle="right-sidebar"]').on('click', function() {
			jQuery('.right-sidebar').addClass('right-sidebar-visible');
		});

		//THEME OPTION CLOSE BUTTON
		$('[data-toggle="right-sidebar-close"]').on('click', function() {
			jQuery('.right-sidebar').removeClass('right-sidebar-visible');
		})