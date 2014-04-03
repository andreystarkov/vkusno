      $(function() {

          $('.btn-cart').transition({y:'200px'}, 10);
          $('.item-link').transition({y:'200px'}, 10);

        var hoverAnimation = 0;

        $('.cart', this).fadeTo(5,1).transition({perspective: '150px', rotateX: '90deg'},5);
        $('.box-item div').hover(function(){
            $('a', this).transition({y:'200px'}, 10);
            $('.cart', this).transition({perspective: '150px', rotateX: '0deg'},500);
            $('.price', this).stop().transition({y:'0'}, 500);
            $('.btn-cart', this).stop().transition({y:'0px'}, 700);
            $('a', this).stop().transition({y:'0px'}, 700);
            $('.name', this).transition({opacity:'1'}, 500);

        },function(){
          $('.cart', this).transition({perspective: '150px', rotateX: '90deg'},200);
          $('.price', this).transition({y:'-200px'}, 50);
          $('.btn-cart', this).transition({y:'200px'}, 50);
          $('a', this).transition({y:'200px'}, 50);
          $('.name', this).transition({opacity:'0.7'}, 50);
        });


      });
