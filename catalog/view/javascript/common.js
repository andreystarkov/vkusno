$(document).ready(function() {
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var search = $('input[name=\'search\']').attr('value');

		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}

		location = url;
	});

	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';

			var search = $('input[name=\'search\']').attr('value');

			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}

			location = url;
		}
	});

	/* Ajax Cart */
	$('#cart > .heading a').on('click', function() {
		$('#cart').addClass('active');

		alert($('#cart').load('index.php?route=module/cart #cart-box'));

		$('#cart').on('mouseleave', function() {
			$(this).removeClass('active');
		});
	});

	/* Mega Menu
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;

			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}

		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');

			$('#column-right + #content').css('margin-right', '195px');

			$('.box-category ul li a.active + ul').css('display', 'block');
		}

		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});

			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});
		}
	}*/

	$('.success img, .warning img, .attention img, .information img').on('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});
});


function ocuCart() {
    $('.ocu-cart .popup-content, .ocu-cart .popup-background').addClass('active');

    $.ajax({
        url: 'index.php?route=checkout/ocu_cart/update',
        dataType: 'json',
        success: function(json) {
            if (json['output']) {
                $('.ocu-cart .popup-content').html(json['output']);
            }
        }
    });
}

function addToCart(product_id) {
    if (product_id) {
        var product_data = 'product_id=' + product_id;
    } else {
        var product_data = $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea');
    }
    $.ajax({
        url: 'index.php?route=checkout/ocu_cart/update',
        type: 'post',
        data: product_data,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['error']) {
                if (json['error']['warning']) {
                    $('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                    $('.warning').fadeIn('slow');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
            }

            if (json['success']) {

	//			$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				$('.btn-cart-icon').addClass('cart-success');
				$('.cart-success').tooltipster('content', json['success']+'<i class="fa fa-check"></i>');
				$('.cart-success').tooltipster('show');
				    setTimeout(function() {
				        $('.cart-success').tooltipster('hide');
				    }, 4000);
	//			$('.success').fadeIn('slow');
				var what = $('.btn-cart-icon span').html();
				$('.btn-cart-icon span').html(parseInt(what)+1);
				$('.btn-cart-icon').addClass('cart-icon-full');
				$('#cart-total').html(json['total']);

                /* Ajax Cart */

                $('.ocu-cart .popup-content, .ocu-cart .popup-background').addClass('active');

                $.ajax({
                    url: 'index.php?route=checkout/ocu_cart/update',
                    dataType: 'json',
                    success: function(json) {
                        if (json['output']) {
                            $('.cart-box').html(json['output']);
                        }
                    }
                });
                updateCart();
        //        $('.cart-box').html(json['total']);
            }
        }
    });
}


function removeCart(key) {
    $.ajax({
        url: 'index.php?route=checkout/ocu_cart/update',
        type: 'post',
        data: 'remove=' + key,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['output']) {
                $('.ocu-cart .cart-items').html(json['total']);

                $('.ocu-cart .popup-content').html(json['output']);
            }
        }
    });
}

function updateCart() {

    var values = '';

    $.each($('.quantity input[type=text]').serializeArray(), function(i, field) {
        values += '&' + [field.name] + '=' + encodeURIComponent(field.value);
    });

    $.ajax({
        url: 'index.php?route=checkout/ocu_cart',
        type: 'post',
        data: values,
        success: function() {
            $.ajax({
                url: 'index.php?route=checkout/ocu_cart/update',
                dataType: 'json',
                success: function(json) {
                    if (json['output']) {
                   //     $('.ocu-cart .cart-items').html(json['total']);
                        $('.cart-box').html(json['output']);
                    }
                }
            });
        }
    });
}
function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}
/*
function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();

			if (json['redirect']) {
				location = json['redirect'];
			}

			if (json['success']) {

	//			$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				$('.btn-cart-icon').addClass('cart-success');
				$('.cart-success').tooltipster('content', json['success']+'<i class="fa fa-check"></i>');
				$('.cart-success').tooltipster('show');
				    setTimeout(function() {
				        $('.cart-success').tooltipster('hide');
				    }, 4000);
	//			$('.success').fadeIn('slow');
				var what = $('.btn-cart-icon span').html();
				$('.btn-cart-icon span').html(parseInt(what)+1);
				$('.btn-cart-icon').addClass('cart-icon-full');
				$('#cart-total').html(json['total']);

			//	$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		}
	});
} */
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();

			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

				$('.success').fadeIn('slow');

				$('#wishlist-total').html(json['total']);

			//	$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		}
	});
}

function addToCompare(product_id) {
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();

			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

				$('.success').fadeIn('slow');

				$('#compare-total').html(json['total']);

			//	$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		}
	});
}