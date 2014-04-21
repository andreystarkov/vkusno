    (function() {

        function rand(min, max){
            return Math.floor((Math.random()*max)+min);
//          return Math.floor(Math.random() * (max - min + 1)) + min;
        }

        var support = { animations : Modernizr.cssanimations },
            animEndEventNames = {
                'WebkitAnimation' : 'webkitAnimationEnd',
                'OAnimation' : 'oAnimationEnd',
                'msAnimation' : 'MSAnimationEnd',
                'animation' : 'animationend'
            },

            animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
            effectSel = document.getElementById( 'fxselect' ),
            component = document.getElementById( 'nice-slider' ),
            items = component.querySelector( 'ul.itemwrap' ).children,
            current = 0,
            itemsCount = items.length,
            nav = component.querySelector( 'nav' ),
            navNext = nav.querySelector( '.next' ),
            navPrev = nav.querySelector( '.prev' ),
            isAnimating = false;

            var effects = ["fxSoftScale", "fxPressAway", "fxSideSwing", "fxFortuneWheel", "fxSwipe", "fxPushReveal", "fxSnapIn",
            "fxLetMeIn", "fxStickIt", "fxArchiveMe", "fxVGrowth", "fxSlideBehind", "fxSoftPulse", "fxCliffDiving"];

            function init() {
                showNav();
                changeEffect();
                navNext.addEventListener( 'click', function( ev ) { ev.preventDefault(); navigate( 'next' ); } );
                navPrev.addEventListener( 'click', function( ev ) { ev.preventDefault(); navigate( 'prev' ); } );
            }

            function hideNav() {
                nav.style.display = 'none';
            }

            function showNav() {
                nav.style.display = 'block';
            }

            function changeEffect() {
                var rnd = rand(0,effects.length);
                var effect = effects[rnd];
                $(component).attr('class', 'nice-slider nice-slider-fullwidth');
                console.log(rnd+" = "+effect);
                classie.addClass( component, effect );
                showNav();
            }

           function captionChange(){
                var captionEffects = [
                    {rotate: '100deg', scale: 0.6, opacity: 0, y: '-500px'},
                    {rotate: '30deg', scale: 0.8, opacity: 0, x: '-400px'},
                    {scale: 6, rotateX: '60deg', perspective: '100px', rotateY: '30deg', opacity: 0, y: '300px', x: '500px'},
                    {scale: 3, rotateX: '80deg', perspective: '170px', rotateY: '10deg', opacity: 0, x: '800px'},
                    {y: '-500px', opacity:0},
                    {x: '300px', opacity:0}
                ];
                var rnd = rand(0, captionEffects.length);
                $('.slider-caption').transition(captionEffects[rnd], 800);
            }

            function navigate( dir ) {

                isAnimating = true;
                var cntAnims = 0;

                var currentItem = items[ current ];

                if( dir === 'next' ) {
                    current = current < itemsCount - 1 ? current + 1 : 0;
                }
                else if( dir === 'prev' ) {
                    current = current > 0 ? current - 1 : itemsCount - 1;
                }

                captionChange();

                var nextItem = items[ current ];

                var onEndAnimationCurrentItem = function() {
                    this.removeEventListener( animEndEventName, onEndAnimationCurrentItem );
                    var caption = $('#'+$(this).attr('data-caption'));
                    $(caption).transition({rotate: '0deg', rotateY: '0deg', rotateX: '0deg', scale: 1, opacity: 1, y: '0px', x: '0px'}, 700);
                    classie.removeClass( this, 'current' );
                    classie.removeClass( this, dir === 'next' ? 'navOutNext' : 'navOutPrev' );
                    ++cntAnims;
                    if( cntAnims === 2 ) {
                        isAnimating = false;
                    }
                    changeEffect();

                }

                var onEndAnimationNextItem = function() {
                    this.removeEventListener( animEndEventName, onEndAnimationNextItem );
                    classie.addClass( this, 'current' );
                    classie.removeClass( this, dir === 'next' ? 'navInNext' : 'navInPrev' );
                    ++cntAnims;
                    if( cntAnims === 2 ) {
                        isAnimating = false;
                    }
                    changeEffect();
                }

                if( support.animations ) {
                    currentItem.addEventListener( animEndEventName, onEndAnimationCurrentItem );
                    nextItem.addEventListener( animEndEventName, onEndAnimationNextItem );
                }
                else {
                    onEndAnimationCurrentItem();
                    onEndAnimationNextItem();
                }

                classie.addClass( currentItem, dir === 'next' ? 'navOutNext' : 'navOutPrev' );
                classie.addClass( nextItem, dir === 'next' ? 'navInNext' : 'navInPrev' );
            }

            init();
            changeEffect()
    })();