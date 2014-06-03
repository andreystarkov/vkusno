/**
 * OpenCart Ukrainian Community
 *
 * LICENSE
 *
 * This source file is subject to the GNU General Public License, Version 3
 * It is also available through the world-wide-web at this URL:
 * http://www.gnu.org/copyleft/gpl.html
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email

 *
 * @category   OpenCart
 * @package    OCU Cart
 * @copyright  Copyright (c) 2011 Eugene Lifescale by OpenCart Ukrainian Community (http://opencart-ukraine.tumblr.com)
 * @license    http://www.gnu.org/copyleft/gpl.html     GNU General Public License, Version 3
 */


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

                /* Ajax Cart */

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

                $('.ocu-cart .cart-items').html(json['total']);
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
                        $('.ocu-cart .cart-items').html(json['total']);
                        $('.ocu-cart .popup-content, #checkout-products').html(json['output']);
                    }
                }
            });
        }
    });
}
