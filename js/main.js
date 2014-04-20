      $(function() {


  /*         $('#left-panel .btn-dropdown').click(function(){
            alert('lol');
              var id = $('a', this.parent()).attr('data-id');
              alert(id);
              var selector = '.sub-child-'+id;
              $('.sub-parent').removeClass('active opened');
              $('.sub-child').slideUp();
              $(this).parent().addClass('active opened');
              $(selector).slideToggle();

          });
         $('.sub-parent').hover(function(){
            $(this).transition({'padding-right': '65px'});
            $( '.btn-dropdown', $(this).parent()).transition({x: '0px', opacity: 1});

          }, function(){

            $(this).transition({'padding-right': '25px'});
            $( '.btn-dropdown', $(this).parent()).transition({x: '60px', opacity: 0});


          }); */
          $('.sub-parent').each(function(){
              $(this).parent().append('<div class="btn-dropdown"><i class="fa fa-angle-down"></i></div>');
          });

          $('#left-panel .parent').click(function(){
              var id = $(this).attr('data-id');
              var selector = '.box-child-'+id;
              if($(this).hasClass('active')){
                $('.sub-parent').removeClass('active opened');
                $('.parent').removeClass('active opened');
                $('#left-panel .logo').transition({height: '242px'});
                $('.box-child').slideUp();
              } else {
                $('.parent').removeClass('active opened');
                $('.box-child').slideUp();
                $('#left-panel .logo').transition({height: '242px'});
                $(this).addClass('active opened');
                $(selector).slideToggle();
             }
          });
        $('#left-panel .item span').transition({perspective: '250px', rotateY: '+90deg'});

         $('#left-panel .item').hover(function(){
            $('span',this).transition({opacity: 1, perspective: '250px', rotateY: '30deg'});
          }, function(){
            $('span',this).transition({perspective: '250px', rotateY: '+90deg'});
          });

          $('.cart .btn-cart').transition({y:'200px'}, 10);
          $('.cart .item-link').transition({y:'200px'}, 10);
          $('.cart .price').transition({y:'-150px', scale: '0.1'}, 10);
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
