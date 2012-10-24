Style.disableBranding();

var text = new Hex('#777');
var darkText = new RGBA(darken(text, 0.45));
darkText.alpha = 0.8;

var innerShadow = {
	color: darkText,
	text_shadow: '1px 1px 3px #fff, 0 0 0 #000, 1px 1px 3px #eee'
};

new Style({
	header: {
		'float': 'left',
		margin: '10px 0 0 10px',

		h1: {
			margin: '10px 0 20px',
			font_size: 42,
			position: 'relative',
			left: -2,
			letter_spacing: 1
		}.extend(innerShadow),

		p: {
			margin: 0,
			color: '#aaa',
			font_size: 18
		}
	}
});

new Style({
	body: {
		cursor: 'default',
		margin: '15px 0',
		padding: 0,
		font: '13px/18px \'Helvetica Neue\', Helvetica, Arial, sans-serif',
		text_align: 'center',
		background_color: '#fff',
		color: text,

		'> div': {
			width: '60%',
			min_width: 700,
			margin: '0 auto',
			text_align: 'left',
			background_image: 'url(images/bg.png)',

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

				ul: {
					list_style: 'none',
					margin: 0,
					padding: 0,

					li: {
						margin: '10px 0',

						'$last-child': {
							margin_bottom: 0
						}
					}
				},

				p: {
					margin: '0 0 10px',

					a: {
						opacity: '0.4',
						display: 'inline-block',
						margin_left: 8,
						height: 22,

						'$first-child':	{
							margin_left: 0
						},

						$hover: {
							opacity: '1.0'
						}
					}.extend(CSS.transition('opacity 0.3s linear'))
				}
			}.extend(CSS.borderRadius(0, 5)),

			'> div:nth-child(2)': {
				padding: 10
			}
		}.extend(CSS.borderRadius(5), CSS.boxShadow(1, 1, 3, 2, '#e0e0e0'))
	}
});

new Style({
	a: {
		color: text
	}
});

new Style({
	address: {
		font_style: 'normal'
	}
});

new Style({
	'body > div > section': {
		display: 'table',
		'float': 'left',
		clear: 'left',
		margin: '10px 10px 0 10px',
		width: 'auto',

		'> section': {
			display: 'table-row',

			'h3, p': {
				display: 'table-cell',
				padding: '3px 10px'
			},

			h3: {
				font_size: 14,
				vertical_align: 'middle',
				color: text,
				background_color: 'rgba(200, 200, 200, 0.3)',
				border_bottom: '#ddd 1px solid',
				letter_spacing: 1,
				font_weight: 'normal',

				$after: {
					content: "':'"
				}
			},

			p: {
				vertical_align: 'top',
				border_bottom: 'rgba(230, 230, 230, 0.5) 1px solid',
				background_color: 'rgba(255, 255, 255, 0.55)'
			},

			'$last-child': {
				'h3, p': {
					border_bottom: 'none' // Clear the border of the last table cells
				}
			}
		},

		'> h2': {
			margin: '15px 0 10px',
			font_size: 28,
			position: 'relative',
			left: -1,
			letter_spacing: 1
		}.extend(innerShadow)
	}
});

new Style({
	article: {
		h3: {
			margin: '15px 0 4px 0',
			color: '#aaa',
			font_size: 18,
			font_weight: 'normal',
			letter_spacing: 1,

			small: {
				font_size: 12
			},

			a: {
				color: '#aaa',
				text_decoration: 'none',
				border_bottom: '#ddd 1px solid'
			}
		},

		p: {
			margin: '0 0 15px 0',
			text_align: 'justify'
		}
	}
});

new Style({
	footer: {
		clear: 'left',

		a: {
			display: 'block',
			text_align: 'center',
			margin: '10px 0',
			padding: 5,
			border_top: 'rgba(230, 230, 230, 0.65) 1px solid',
			background_color: 'rgba(230, 230, 230, 0.5)',
			text_decoration: 'none',

			$hover: {
				text_decoration: 'underline'
			}
		}
	}
});