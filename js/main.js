
    /* jquery plugins & events init | m-vkusno.ru
       root@webscapes.ru */

    $(function() {

        $('.box-child').hide();
        $('.box-sub-child').hide();
        $('.cart-box').transition({x: '400px'},10);

        $(".box-child").each(function(){
          var menuCount = $(this).children().length;
          if (menuCount > 5){
            if( !($('.item', this).hasClass('sub-parent')) ) {
              $(this).css({overflow: 'hidden', paddingTop: '5px', paddingRight: '35px', paddingLeft: '10px'});
              $('.item', this).addClass('grid-menu');
              $('.item', this).css({padding: '5px 10px'});
              $('li', this).css({display: 'inline-block', 'float': 'left', width: 'auto'});
           }
          }
        });

        appendClass( $('.jcarousel-next-horizontal'), '<i class="fa fa-angle-right"></i>');
        appendClass( $('.jcarousel-prev-horizontal'), '<i class="fa fa-angle-left"></i>');
        appendClass( $('.sub-parent').parent(), '<div class="btn-dropdown"><i class="fa fa-angle-down"></i></div>');

        $('.box-page ul li').each(function(){
          $(this).html('<i class="fa fa-angle-right"></i> ' + $(this).html());
        });

        $('.heading', '#carousel0').html('Наши рестораны').css({'margin-left': '-40px'});
        $('.heading', '#carousel1').html('Наши партнеры').css({'margin-left': '-40px'});
        $('#left-panel .item span').transition({perspective: '250px', rotateY: '+90deg'}, 10);
        $('.cart .btn-cart').transition({y:'200px'}, 10);
        $('.cart .item-link').transition({y:'200px'}, 10);
        $('.cart .price').transition({y:'-150px', scale: '0.1'}, 10);

        var $container = $('.box-newsfeed');

        $container.masonry({
          columnWidth: 20,
          itemSelector: '.news-item'
        });

        var msnry = $container.data('masonry');

        $('.tip').tooltipster({ animation: 'grow', delay: 200,
          theme: 'tip-default', touchDevices: false, trigger: 'hover'
        });

        $('.tip-error').tooltipster({ animation: 'fall', delay: 200, position: 'bottom',
          theme: 'tooltipster-punk', touchDevices: false, trigger: 'hover'
        });

        $('.hover-info').tooltipster({ animation: 'grow', delay: 200, position: 'bottom',
          theme: 'tooltipster-punk', touchDevices: false, trigger: 'hover'
        });

        $('.tip-info').tooltipster({ animation: 'fall', delay: 200, position: 'bottom',
          theme: 'tooltipster-punk', touchDevices: false, trigger: 'hover'
        });

        $('.product-filter .fa').click(function(){
          if ( $(this).parent().hasClass('box-lightgray') ){
           $(this).parent().addClass('inactive').removeClass('box-lightgray');

         } else {
            $(this).parent().removeClass('inactive').addClass('box-lightgray');
         }
        });

        $('.caption-current').fadeToggle();

        $('.btn-mini-cart').click(function(){
          if( $(this).hasClass('active') ){
           $(this).removeClass('active');
           $(this).parent().transition({right: '-295px', height: '70px'});
           $('.cart-box').transition({x: '600px'});

         } else {
            $(this).addClass('active');
            $(this).parent().transition({right: '20px', height: 'auto'});
            $('.cart-box').transition({x: '0px'});
         }
        });

        $('.mini-cart-holder').hover(function(){

        }, function(){
    //      $(this).stop(1000).transition({right: '-295px'});
      //    $('.cart-box', this).stop(1000).transition({x: '600px'});
        });

        $('#btn-full-nav').click(function(){
          if($('#box-container').css('padding-left') == '70px'){
            $('i', this).transition({rotate: '0deg'});

            $('#box-container').animate({paddingLeft: '420px'});
            $('#left-panel').transition({x: '0'});
            $('#slider-wrapper').animate({paddingLeft: '350px'});
         } else {
          $('i', this).transition({rotate: '180deg'});
          $('#box-container').animate({paddingLeft: '70px'});
          $('#slider-wrapper').animate({paddingLeft: '0px'});
          $('#left-panel').transition({x: '-350px'});
         }
        });

        $('#box-container').css({'min-height': $(window).height()-140});

        $('.tip-icons').tooltipster({ delay: 400, position: 'left', contentAsHTML: true,
          theme: 'tip-cart-success', touchDevices: true, trigger: 'custom', autoClose: true, animation: 'grow', interactive: 'true'
        });

        $('.tip-description').tooltipster({ delay: 200, position: 'bottom', contentAsHTML: true,
          theme: 'tip-product-description', touchDevices: true, trigger: 'hover', animation: 'grow', offsetY: '-20'
        });

        $(window).keypress(function() {
             $('.tip-icons').tooltipster('hide');
         });
        $('.tooltip').tooltipster();

        $('#left-panel .parent').click(function(){
          toggleNavCategory($(this));
        });

        $('#left-panel .btn-dropdown').click(function(){
          toggleNavSubCategory($(this));
        });
         // toggleNavCategory($('.parent-84'));
/*         $('#left-panel .item span').css({'z-index': '9999'});
         $('#left-panel .item').hover(function(){
            $('span',this).transition({opacity: 1, perspective: '250px', rotateY: '30deg'});
          }, function(){
            $('span',this).transition({perspective: '250px', rotateY: '+90deg'});
        });*/

        $('.box-item div').hover(function(){
            //  $(this).transition({rotateX: '-5deg', perspective: '450px'});
            $('.price', this).transition({y:'0px', scale: '1'}, 500);
            $('a', this).transition({y:'200px'}, 10);
            $('.cart', this).transition({boxShadow: 'inset 0 -15px 40px rgba(0,0,0,0.3)',opacity: 1},500);
            $('.btn-cart', this).stop().transition({opacity: 1, y:'0px'}, 700);
            $('a', this).stop().transition({opacity: 1, y:'0px'}, 700);
            $('.name', this).transition({opacity:'1'}, 500);
        },function(){
          //  $(this).transition({rotateX: '0deg', perspective: '450px'});
          $('.cart', this).transition({boxShadow: 'inset 0 0px 0px rgba(0,0,0,0)', opacity: 0},300);
          $('.price', this).transition({y:'-150px', scale: '0.1'}, 10);
          $('.btn-cart', this).transition({y:'200px'}, 200);
          $('a', this).transition({y:'200px'}, 200);
          $('.name', this).transition({opacity:'0.7'}, 200);
        });

        $('#skel-panels-pageWrapper').height($('body').height());

        $('.cart-info .quantity').append('<i class="count-left fa fa-angle-left"></i><i class="count-right fa fa-angle-right"></i>');
        $('.quantity .count-right').click(function(){
            var currentVal = parseInt($('input', $(this).parent()).val());
            if (!isNaN(currentVal)) {
                $('input', $(this).parent()).val(currentVal + 1);
            }
        });

        $('.quantity .count-left').click(function(){
            var currentVal = parseInt($('input', $(this).parent()).val());
            if (!isNaN(currentVal)) {
                $('input', $(this).parent()).val(currentVal - 1);
            }
        });
    });
