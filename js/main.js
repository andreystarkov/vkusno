      $(function() {

          $('.btn-cart').transition({y:'200px'}, 10);
          $('.item-link').transition({y:'200px'}, 10);
          $('.price').transition({y:'-150px', scale: '0.1'}, 10);
          var hoverAnimation = 0;
          $('.cart').fadeTo(5,1).transition({perspective: '150px', rotateX: '90deg'},5);

        $('.box-item div').hover(function(){
            $('.price', this).transition({y:'0px', scale: '1'}, 500);
            $('a', this).transition({y:'200px'}, 10);
            $('.cart', this).transition({boxShadow: 'inset 0 -15px 40px rgba(0,0,0,0.3)',opacity: 1, perspective: '150px', rotateX: '0deg'},500);

            $('.btn-cart', this).stop().transition({opacity: 1, y:'0px'}, 700);
            $('a', this).stop().transition({opacity: 1, y:'0px'}, 700);
            $('.name', this).transition({opacity:'1'}, 500);

        },function(){
          $('.cart', this).transition({boxShadow: 'inset 0 0px 0px rgba(0,0,0,0)', opacity: 0, perspective: '150px', rotateX: '90deg'},300);
          $('.price', this).transition({y:'-150px', scale: '0.1'}, 10);
          $('.btn-cart', this).transition({y:'200px'}, 200);
          $('a', this).transition({y:'200px'}, 200);
          $('.name', this).transition({opacity:'0.7'}, 200);
        });


      });
