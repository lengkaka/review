var require = {
    baseUrl: './lib',
    paths: {
        'jquery': 'jquery',
        'lodash': 'lodash',
        'backbone': 'backbone',
        'marionette': 'backbone.marionette',
        'handlebars': 'handlebars',
        'module': '../module',
        'view': '../view'
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
