$(function() {

    function rand(min, max){
      return Math.floor(Math.random() * (max - min + 1)) + min;
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
        component = $( '#nice-slider' ),
        items = $( 'ul.itemwrap' ).children,
        current = 0,
        itemsCount = items.length,
        nav = $( '#slider-nav' ),
        navNext = $( '.next' ),
        navPrev = $( '.prev' ),
        isAnimating = false;

        navNext.click(function(){
            navigate( 'next' );
        });

        navPrev.click(function(){
            navigate( 'prev' );
        });
        var effects = ["fxSoftScale", "fxPressAway", "fxSideSwing", "fxFortuneWheel", "fxSwipe", "fxPushReveal", "fxSnapIn",
        "fxLetMeIn", "fxStickIt", "fxArchiveMe", "fxVGrowth", "fxSlideBehind", "fxSoftPulse", "fxEarthquake","fxCliffDiving"];

        function init() {
            showNav();
            changeEffect();
        }

        function hideNav() {
            nav.css({'display': 'none'});
        }

        function showNav() {
            nav.css({'display': 'block'});
        }

        function changeEffect() {
            var rnd = rand(0,effects.length)
            var effect = effects[rnd];
            console.log(rnd+" = "+effect);
            component.addClass(effect);
            showNav();
        }

        function navigate( dir ) {
            changeEffect();
            isAnimating = true;
            var cntAnims = 0;

            var currentItem = items[ current ];

            if( dir === 'next' ) {
                current = current < itemsCount - 1 ? current + 1 : 0;
            }
            else if( dir === 'prev' ) {
                current = current > 0 ? current - 1 : itemsCount - 1;
            }

            var nextItem = items[ current ];

            var onEndAnimationCurrentItem = function() {
                $(this).removeClass( 'current' );
                $(this).removeClass( dir === 'next' ? 'navOutNext' : 'navOutPrev' );
                ++cntAnims;
                if( cntAnims === 2 ) {
                    isAnimating = false;
                }
            }

            var onEndAnimationNextItem = function() {
                $(this).addClass( 'current' );
                $(this).removeClass( dir === 'next' ? 'navInNext' : 'navInPrev' );
                ++cntAnims;
                if( cntAnims === 2 ) {
                    isAnimating = false;
                }
            }

                onEndAnimationCurrentItem();
                onEndAnimationNextItem();

           currentItem.addClass( dir === 'next' ? 'navOutNext' : 'navOutPrev' );
           nextItem.addClass( dir === 'next' ? 'navInNext' : 'navInPrev' );
        }

        init();
        changeEffect()
});