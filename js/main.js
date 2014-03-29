      $(function() {

        function init() {
            var speed = 330,
                easing = mina.backout;

            [].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
                var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
                    pathConfig = {
                        from : path.attr( 'd' ),
                        to : el.getAttribute( 'data-path-hover' )
                    };

                el.addEventListener( 'mouseenter', function() {
                    path.animate( { 'path' : pathConfig.to }, speed, easing );
                } );

                el.addEventListener( 'mouseleave', function() {
                    path.animate( { 'path' : pathConfig.from }, speed, easing );
                } );
            } );
        }

        init();

        var Page = (function() {

          var $nav = $( '#nav-dots > span' ),
            slitslider = $( '#slider' ).slitslider( {
              onBeforeChange : function( slide, pos ) {

                $nav.removeClass( 'nav-dot-current' );
                $nav.eq( pos ).addClass( 'nav-dot-current' );

              }
            } ),

            init = function() {

              initEvents();

            },
            initEvents = function() {

              $nav.each( function( i ) {

                $( this ).on( 'click', function( event ) {

                  var $dot = $( this );

                  if( !slitslider.isActive() ) {

                    $nav.removeClass( 'nav-dot-current' );
                    $dot.addClass( 'nav-dot-current' );

                  }

                  slitslider.jump( i + 1 );
                  return false;

                } );

              } );

            };

            return { init : init };

        })();

        $('.box-item div').hover(function(){
            $('.cart', this).fadeTo(400,1);
            $('.price', this).fadeTo(500,1);
            $('.name', this).fadeTo(500,1);
        },function(){
          $('.cart', this).fadeTo(600,0);
          $('.price', this).fadeTo(500,0.7);
          $('.name', this).fadeTo(500,0.7);
        });
        Page.init();

      });
