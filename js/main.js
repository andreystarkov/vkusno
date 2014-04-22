
    /* jquery plugins & events init | m-vkusno.ru
       root@webscapes.ru */

    $(function() {

        $('.box-child').hide();
        $('.box-sub-child').hide();

        appendClass( $('.jcarousel-next-horizontal'), '<i class="fa fa-angle-right"></i>');
        appendClass( $('.jcarousel-prev-horizontal'), '<i class="fa fa-angle-left"></i>');
        appendClass( $('#left-panel .item span'), ' товаров');
        appendClass( $('#left-panel .child'), '<b class="fa this fa-angle-double-right"></b>');
        appendClass( $('.sub-parent').parent(), '<div class="btn-dropdown"><i class="fa fa-angle-down"></i></div>');

        $('#left-panel .item span').transition({perspective: '250px', rotateY: '+90deg'}, 10);
        $('.cart .btn-cart').transition({y:'200px'}, 10);
        $('.cart .item-link').transition({y:'200px'}, 10);
        $('.cart .price').transition({y:'-150px', scale: '0.1'}, 10);

        $('.hover-info').tooltipster({ animation: 'grow', delay: 200, position: 'bottom',
          theme: 'tooltipster-punk', touchDevices: false, trigger: 'hover'
        });

        $('.tip-info').tooltipster({ animation: 'fall', delay: 200, position: 'bottom',
          theme: 'tooltipster-punk', touchDevices: false, trigger: 'hover'
        });

        $('.tip-icons').tooltipster({ animation: 'fall', delay: 200, position: 'bottom',
          theme: 'tooltipster-nice', touchDevices: false, trigger: 'hover'
        });

        $('.tooltip').tooltipster();

        $('#left-panel .parent').click(function(){
          toggleNavCategory($(this));
        });

        $('#left-panel .btn-dropdown').click(function(){
          toggleNavSubCategory($(this));
        });

         $('#left-panel .item').hover(function(){
            $('span',this).transition({opacity: 1, perspective: '250px', rotateY: '30deg'});
          }, function(){
            $('span',this).transition({perspective: '250px', rotateY: '+90deg'});
        });

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

    });
