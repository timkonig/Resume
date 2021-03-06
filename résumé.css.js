var text = new Hex('#777');
var lightText = lighten(text, 0.45);
var darkText = new RGBA(darken(text, 0.45));
darkText.alpha = 0.8;

var innerShadow = {
	color: darkText,
	text_shadow: '1px 1px 3px #fff, 0 0 0 #000, 1px 1px 3px #eee'
};

var photoShadow = CSS.boxShadow(0, 1, 3, 'rgba(0, 0, 0, 0.4)');

new Style({
	header: {
		'float': 'left',
		margin: '10px 0 50px 10px',

		h1: {
			margin: '10px 0 20px',
			font_size: 42,
			position: 'relative',
			left: -2,
			letter_spacing: 1
		}.extend(innerShadow),

		p: {
			margin: 0,
			color: lightText,
			font_size: 16
		}
	}
});

/**
 * Basic styles
 */
new Style({
	a: {
		color: text,

		img: {
			border: 'none'
		}
	},

	abbr: {
		border_bottom: '#ccc 1px dotted'
	},

	address: {
		font_style: 'normal',
		margin_top: 15
	}
});

new Style({
	body: {
		cursor: 'default',
		margin: 0,
		padding: 0,
		font: '13px/18px \'Helvetica Neue\', Helvetica, Arial, sans-serif',
		text_align: 'center',
		background_color: '#fff',
		color: text,

		'> div': {
			width: '60%',
			min_width: 640,
			margin: '0 auto',
			text_align: 'left',
			background: '#fbfbfb url(images/bg.png)',
			border_left: 'rgba(230, 230, 230, 0.65) 1px solid',
			border_right: 'rgba(230, 230, 230, 0.65) 1px solid',

			/**
			 * Right floating DIV, containing social links, address & contact details
			 */
			'> div:first-child': {
				'float': 'right',
				position: 'relative',
				font_style: 'normal',
				color: text,
				background_color: 'rgba(230, 230, 230, 0.35)',
				border_left: 'rgba(230, 230, 230, 0.65) 1px solid',
				border_bottom: 'rgba(230, 230, 230, 0.65) 1px solid',
				padding: '10px 10px 10px',
				margin: '0 0 10px 10px',

				ul: {
					list_style: 'none',
					margin: '0 auto',
					padding: 0
				},

				p: {
					margin: '0 5px 20px 6px',
					position: 'relative',
					z_index: '10',

					img: {
						max_width: '100%',
						height: 'auto',
						vertical_align: 'bottom',
						border: '5px solid #fff',
						border_radius: 3,
						_webkit_box_sizing: 'border-box',
						_moz_box_sizing: 'border-box',
						box_sizing: 'border-box'
					}.extend(photoShadow)
				},

				'p:before, p:after': {
					content: '""',
					background_color: '#fff',
					border_radius: 3,
					width: '100%',
					height: '100%',
					position: 'absolute',
					border: 'none',
					left: 0
				}.extend(CSS.transformOrigin('bottom left'), CSS.boxSizing('border-box'), photoShadow),

				'p:before': {
					z_index: '-10'
				}.extend(CSS.transform('rotate(1.35deg)')),

				'p:after': {
					top: 4,
					z_index: '-20'
				}.extend(CSS.transform('rotate(-1.35deg)')),

				'ul:nth-child(2)': {
					height: 22,

					li: {
						margin_left: 10,
						min_width: 22,
						display: 'inline',

						'$first-child': {
							margin_left: 0
						}
					},

					a: {
						opacity: '0.4',
						height: 22,

						$hover: {
							opacity: '1.0'
						}
					}.extend(CSS.transition('opacity 0.3s linear'))
				},

				'ul:last-child': {
					clear: 'left',

					li: {
						margin: '10px 0',

						'$last-child': {
							margin_bottom: 0
						}
					}
				}
			}.extend(CSS.borderRadius(0, 5)),

			'> div:nth-child(2)': {
				padding: 10
			}
		}
	}
});

/**
 * Skills table
 */
new Style({
	'body > div > section': {
		clear: 'left',
		margin: '45px 10px 0',

		'> section': {
			display: 'table-row',

			'h3, p': {
				display: 'table-cell',
				padding: '3px 10px',
				text_align: 'justify'
			},

			h3: {
				font_size: 14,
				vertical_align: 'middle',
				color: text,
				background_color: 'rgba(200, 200, 200, 0.3)',
				border_top: '#f3f3f3 1px solid',
				border_bottom: '#ddd 1px solid',
				letter_spacing: 1,
				font_weight: 'normal',
				margin: 0,

				$after: {
					content: "':'"
				}
			},

			p: {
				vertical_align: 'top',
				border_bottom: 'rgba(230, 230, 230, 0.5) 1px solid',
				background_color: 'rgba(255, 255, 255, 0.55)',
				margin: 0
			},

			'$last-child': {
				'h3, p': {
					border_bottom: 'none' // Clear the border of the last table cells
				}
			}
		},

		'section:nth-child(2) h3': {
			border_top: 'none'
		},

		'> h2': {
			margin: '0 0 10px',
			font_size: 28,
			position: 'relative',
			left: -1,
			letter_spacing: 1
		}.extend(innerShadow)
	}
});

/**
 * Experiences, roles & projects
 */
new Style({
	article: {
		h3: {
			margin: '15px 0 4px 0',
			color: lightText,
			font_size: 18,
			font_weight: 'normal',
			letter_spacing: 1,
			line_height: 22,

			'small, strong': {
				font_size: 12
			},

			strong: {
				font_weight: 'normal'
			},

			a: {
				color: lightText,
				text_decoration: 'none',
				border_bottom: '#ddd 1px solid'
			}
		},

		p: {
			margin: '0 0 10px 0',
			text_align: 'justify'
		},

		section: {
			h2: {
				font_weight: 'normal'
			},

			margin_left: 15,
			padding_left: 15,
			border_left: lightText + ' 1px dotted'
		}
	}
});

new Style({
	footer: {
		p: {
			margin: '45px 0 0'
		},

		a: {
			display: 'block',
			text_align: 'center',
			margin: '10px 0 0',
			padding: '5px 0 7px 0',
			border_top: 'rgba(230, 230, 230, 0.65) 1px solid',
			background_color: 'rgba(230, 230, 230, 0.5)',
			text_decoration: 'none',

			$hover: {
				text_decoration: 'underline'
			}
		}
	}
});