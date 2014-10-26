var require = {
    baseUrl: './lib',
    paths: {
        'jquery': 'jquery',
        'lodash': 'lodash',
        'backbone': 'backbone',
        'marionette': 'backbone.marionette'
    },
    shim: {
        'backbone': {
            deps: ['lodash', 'jquery'],
            exports: 'Backbone'
        },
        'marionette': {
            deps: ['lodash'],
            exports: 'Marionette'
        },
        'jquery': {
            exports: '$'
        },
        'lodash': {
            exports: '_'
        }
    }
};