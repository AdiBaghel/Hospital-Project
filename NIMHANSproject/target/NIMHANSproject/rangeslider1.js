                           var sheet1 = document.createElement('style1'), $rangeInput1 = $('.range1 input'), prefs = [
								'webkit-slider-runnable-track1',
								'moz-range-track1', 'ms-track1' ];

						document.body.appendChild(sheet1);

						var getTrackStyle1 = function(el) {
							var curVal = el.value, val = (curVal - 1) * 16.666666667, style1 = '';

							// Set active label
							$('.range1-labels li')
									.removeClass('active1 selected1');

							var curLabel = $('.range1-labels').find(
									'li:nth-child(' + curVal + ')');

							curLabel.addClass('active1 selected1');
							//curLabel.prevAll().addClass('selected');

							return style1;
						}

						$rangeInput1.on('input', function() {
							sheet1.textContent = getTrackStyle1(this);
						});

						// Change input value on label click
						$('.range1-labels li').on('click', function() {
							var index = $(this).index();

							$rangeInput1.val(index + 1).trigger('input');

						});