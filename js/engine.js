
    /* core front end functions | m-vkusno.ru
       root@webscapes.ru */

    function appendClass(obj, html){
      $(obj).each(function(){
        $(this).append(html);
      });
    }

    function toggleNavSubCategory(obj){
      var link = $('.sub-parent', obj.parent());
      var id = link.attr('data-id');
      var box = '.sub-child-'+id;
      var sub = '<? echo $paths[1]; ?>';

       if(link.hasClass('opened')){
        $('i', obj).transition({rotate: '0deg'}, 600);
        $('.sub-parent').removeClass('opened');
        $(box).slideUp();
      } else {
        $('i', obj).transition({rotate: '180deg'}, 600);
        $('.sub-parent').removeClass('opened');
        $('.box-sub-child').slideUp(200);
        link.addClass('opened');
        if (sub == id) { link.addClass('active'); }
        $(box).slideDown(500);
     }
    }

    function toggleNavCategory(obj){
        var id = obj.attr('data-id');
        var selector = '.box-child-'+id;
        if(obj.hasClass('opened')){
          $('.sub-parent').removeClass('opened');
          $('.parent').removeClass('opened');
          $('.box-child').slideUp();
        } else {
          $('.parent').removeClass('opened');
          $('.box-child').slideUp();
          obj.addClass('opened');
          $(selector).slideToggle();
       }
    }

    $(function(){

      $(window).scroll(function(){
        if($(this).scrollTop()>120){
          $('.mini-cart-holder').css({top: 15+$(this).scrollTop()});
          $('.nav-items').css({position: 'fixed',top: 15+$(this).scrollTop(), width: $('#left-panel').width()});
        }
        if($(this).scrollTop()<120){
          $('.mini-cart-holder').css({top: '15px'});
          $('.nav-items').css({position: 'relative', top: '0px'});
        }
      });

});
