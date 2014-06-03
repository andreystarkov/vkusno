
    var vkusno_settings = {

            skelJS: {
                prefix: 'css/responsive/style',
                resetCSS: false,
                boxModel: 'border',
                useOrientation: true,
                breakpoints: {
                    'widest':   { range: '1881-', hasStyleSheet: false, containers: 1400, grid: { gutters: 40 } },
                    'wide': { range: '961-1880', containers: 1200, grid: { gutters: 40 } },
                    'normal':   { range: '961-1620', containers: 960, grid: { gutters: 40 } },
                    'narrow':   { range: '961-1320', containers: 'fluid', grid: { gutters: 20 } },
                    'narrower': { range: '-960', containers: 'fluid', grid: { gutters: 15 } },
                    'mobile':   { range: '-640', containers: 'fluid', lockViewport: true, grid: { gutters: 15, collapse: true } }
                }
            },

            skelJSPlugins: {
                panels: {
                    panels: {
                        sidePanel: {
                            breakpoints: 'narrower',
                            position: 'left',
                            size: 300,
                            html: '<div data-action="moveElement" data-args="left-panel"></div>'
                        },

                         rightPanel: {
                            breakpoints: 'narrower',
                            position: 'right',
                            size: 240,
                            html: '<div data-action="moveElement" data-args="mini-cart"></div>'
                        }
                    },
                    overlays: {
                        sidePanelToggle: {
                            breakpoints: 'narrower',
                            position: 'top-left',
                            width: '160px',
                            height: '50px',
                            html: '<div data-action="togglePanel" data-args="sidePanel" class="toggle"><i class="fa fa-bars"></i> Категории</div>'
                        },
                        rightPanelToggle: {
                            breakpoints: 'narrower',
                            position: 'top-right',
                            width: '160px',
                            right: '10px',
                            height: '50px',
                            html: '<div data-action="togglePanel" data-args="rightPanel" class="toggle">Меню <i class="fa fa-home"></i></div>'
                        }
                    }
                }
            }

    };

    skel.init(vkusno_settings.skelJS, vkusno_settings.skelJSPlugins);